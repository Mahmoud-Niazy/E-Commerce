import '../../../../home/data/models/product_model.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class GetCartProductsLoadingState extends CartStates {}

class GetCartProductsSuccessfullyState extends CartStates {
  List<ProductModel> cart = [];

  GetCartProductsSuccessfullyState(this.cart);
}

class GetCartProductsErrorState extends CartStates {
  final String error;

  GetCartProductsErrorState(
    this.error,
  );
}

class AddOrRemoveCartProductLoadingState extends CartStates {}

class AddOrRemoveCartProductSuccessfullyState extends CartStates {}

class AddOrRemoveCartProductErrorState extends CartStates {
  final String error;

  AddOrRemoveCartProductErrorState(this.error);
}
