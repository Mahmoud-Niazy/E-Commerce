import '../../../../home/data/models/product_model.dart';

abstract class FavouritesStates{}

class FavouritesInitialState extends FavouritesStates{}

class GetFavouritesLoadingState extends FavouritesStates{}
class GetFavouritesSuccessfullyState extends FavouritesStates{
  List<ProductModel> favourites = [];
  GetFavouritesSuccessfullyState(this.favourites);
}
class GetFavouritesErrorState extends FavouritesStates{
  final String error ;
  GetFavouritesErrorState(this.error);
}

class AddOrRemoveFavouriteLoadingState extends FavouritesStates{}
class AddOrRemoveFavouriteSuccessfullyState extends FavouritesStates{}
class AddOrRemoveFavouriteErrorState extends FavouritesStates{
  final String error;
  AddOrRemoveFavouriteErrorState(this.error);
}