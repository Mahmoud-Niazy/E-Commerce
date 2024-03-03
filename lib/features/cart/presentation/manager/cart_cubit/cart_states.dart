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

class ChangeCartProductsLoadingState extends CartStates {}

class AddCartProductState extends CartStates {}
class RemoveCartProductState extends CartStates {}


class AddOrRemoveCartProductErrorState extends CartStates {
  final String error;

  AddOrRemoveCartProductErrorState(this.error);
}


class IncreaseCountState extends CartStates{}
class DecreaseCountState extends CartStates{}

class CalcTotalPriceState extends CartStates{}


class PaymentLoadingState extends CartStates{}
class PaymentSuccessState extends CartStates{}
class PaymentErrorState extends CartStates{
  final String error ;
  PaymentErrorState(this.error);
}


