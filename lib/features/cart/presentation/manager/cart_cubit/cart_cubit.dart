import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../data/repos/cart_repo.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  final CartRepo cartRepo;
  List<ProductModel> cartProducts = [];
  List<int> productsCount = [];

  CartCubit(
    this.cartRepo,
  ) : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of<CartCubit>(context);

  getCartProducts() async {
    emit(GetCartProductsLoadingState());
    var data = await cartRepo.getCartProducts();

    data.fold(
      (error) => emit(GetCartProductsErrorState(
        error.errorMessage,
      )),
      (cart) {
        cartProducts = cart;
        for(int i =0; i < cartProducts.length ; i++){
          productsCount.add(1);
          // totalPrice += cartProducts[i].price * productsCount[i];
        }
        emit(GetCartProductsSuccessfullyState(
          cart,
        ));

      },
    );
  }

  increaseCount(int index){
    productsCount[index]++;
    calcTotalPrice();
    emit(IncreaseCountState());
  }

  decreaseCount(int index){
    productsCount[index]--;
    calcTotalPrice();
    emit(DecreaseCountState());
  }

  calcTotalPrice(){
    num total = 0;
    for (int i =0 ; i<cartProducts.length ;i ++) {
      total += cartProducts[i].price * productsCount[i];
    }
   return total;
  }



  addOrRemoveCartProduct({
    required int productId,
  }) async {
    emit(AddOrRemoveCartProductLoadingState());
    var data = await cartRepo.addOrRemoveCartProduct(productId: productId);
    data.fold(
      (error) => emit(AddOrRemoveCartProductErrorState(error.errorMessage)),
      (success) => emit(AddOrRemoveCartProductSuccessfullyState()),
    );
  }



}
