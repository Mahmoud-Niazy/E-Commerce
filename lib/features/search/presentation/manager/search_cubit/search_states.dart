import '../../../../home/data/models/product_model.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates{}

class SearchLoadingState extends SearchStates{}
class SearchSuccessState extends SearchStates{
  List<ProductModel> products ;
  SearchSuccessState(this.products);
}
class SearchErrorState extends SearchStates{
  final String error ;
  SearchErrorState(this.error);
}
