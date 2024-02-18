import '../../../data/models/banner_model.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/product_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates{}

class GetBannersLoadingState extends HomeStates{}
class GetBannersSuccessState extends HomeStates{
  final List<BannerModel> banners;
  GetBannersSuccessState(this.banners);
}
class GetBannersErrorState extends HomeStates{
  final String error;
  GetBannersErrorState(this.error);
}

class GetProductsLoadingState extends HomeStates{}
class GetProductsSuccessState extends HomeStates{
  List<ProductModel> products;
  GetProductsSuccessState(this.products);
}
class GetProductsErrorState extends HomeStates{
  final String error;
  GetProductsErrorState(this.error);
}

class GetCategoriesLoadingState extends HomeStates{}
class GetCategoriesSuccessState extends HomeStates{
  List<CategoryModel> categories = [];
  GetCategoriesSuccessState(this.categories);
}
class GetCategoriesErrorState extends HomeStates{
  final String error;
  GetCategoriesErrorState(this.error);
}

class SelectSpecificCategoryState extends HomeStates{}
class SelectAllCategoriesState extends HomeStates{}