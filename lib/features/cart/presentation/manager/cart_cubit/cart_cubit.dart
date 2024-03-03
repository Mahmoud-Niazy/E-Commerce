import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../data/repos/cart_repo.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  final CartRepo cartRepo;
  List<ProductModel> cartProducts = [];
  List<int> everyProductCount = [];
  List<int> cartProductsIds = [];
  int cartProductsCount = 0;

  CartCubit(
    this.cartRepo,
  ) : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of<CartCubit>(context);

  getCartProducts() async {
    cartProductsIds = [];
    emit(GetCartProductsLoadingState());
    var data = await cartRepo.getCartProducts();
    data.fold(
      (error) => emit(GetCartProductsErrorState(
        error.errorMessage,
      )),
      (cart) {
        cartProducts = cart;
        for (int i = 0; i < cartProducts.length; i++) {
          everyProductCount.add(1);
          cartProductsIds.add(cartProducts[i].id);
          // totalPrice += cartProducts[i].price * productsCount[i];
        }
        cartProductsCount = cartProducts.length;
        emit(GetCartProductsSuccessfullyState(
          cart,
        ));
      },
    );
  }

  increaseCount(int index) {
    everyProductCount[index]++;
    calcTotalPrice();
    emit(IncreaseCountState());
  }

  decreaseCount(int index) {
    everyProductCount[index]--;
    calcTotalPrice();
    emit(DecreaseCountState());
  }

  calcTotalPrice() {
    num total = 0;
    for (int i = 0; i < cartProducts.length; i++) {
      total += cartProducts[i].price * everyProductCount[i];
    }
    return total;
  }

  addOrRemoveCartProduct({
    required ProductModel product,
  }) async {
    if (cartProducts.contains(product)) {
      cartProducts.remove(product);
      cartProductsIds.remove(product.id);
      cartProductsCount--;
      emit(RemoveCartProductState());
    } else {
      cartProducts.add(product);
      cartProductsIds.add(product.id);
      cartProductsCount++;
      emit(AddCartProductState());
    }
    var data = await cartRepo.addOrRemoveCartProduct(productId: product.id);
    data.fold(
      (error) => emit(AddOrRemoveCartProductErrorState(error.errorMessage)),
      (success) async {
        await getCartProducts();

        emit(ChangeCartProductsLoadingState());
      },
    );
  }

  makePayment({
    required String amount,
    required String currency,
    required String customerStripeId,
  }) async {
    emit(PaymentLoadingState());
    var data = await cartRepo.makePayment(
      amount: amount,
      currency: currency,
      customerStripeId: customerStripeId,
    );
    data.fold(
      (failure) => emit(PaymentErrorState(
        failure.errorMessage,
      )),
      (success) => emit(PaymentSuccessState()),
    );
  }
}
