import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/cart_repo.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  final CartRepo cartRepo;

  CartCubit(
    this.cartRepo,
  ) : super(CartInitialState());

  getCartProducts() async {
    emit(GetCartProductsLoadingState());
    var data = await cartRepo.getCartProducts();

    data.fold(
      (error) => emit(GetCartProductsErrorState(
        error.errorMessage,
      )),
      (cart) => emit(GetCartProductsSuccessfullyState(
        cart,
      )),
    );
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
