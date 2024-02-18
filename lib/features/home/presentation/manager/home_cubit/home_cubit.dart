import 'package:ecommerce/features/home/data/models/banner_model.dart';
import 'package:ecommerce/features/home/data/models/category_model.dart';
import 'package:ecommerce/features/home/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<BannerModel> allBanners = [];

  getBanners() async {
    emit(GetBannersLoadingState());
    var data = await homeRepo.getBanners();
    data.fold(
      (error) => emit(GetBannersErrorState(error.errorMessage)),
      (banners) {
        allBanners = banners;
        emit(GetBannersSuccessState(banners));
      },
    );
  }

  List<ProductModel> homeProducts = [];

  getAllProducts() async {
    emit(GetProductsLoadingState());
    var data = await homeRepo.getProducts();
    data.fold(
          (error) => emit(GetProductsErrorState(error.errorMessage)),
          (products) {
            homeProducts = products;
            emit(GetProductsSuccessState(products));
          },
    );
  }

  int currentIndex = 0;
  bool isAllProductsShown = true ;

  colorAllProductCategory(){
    isAllProductsShown = true;
    emit(SelectAllCategoriesState());
  }

  colorSpecificCategory(int index){
    isAllProductsShown = false;
    currentIndex = index;
    emit(SelectSpecificCategoryState());
  }

  getProductsSpecificInCategory({
    required int categoryId,
})async{
    emit(GetProductsLoadingState());
    var data = await homeRepo.getProductsSpecificInCategory(categoryId: categoryId);
    data.fold(
          (error) => emit(GetProductsErrorState(error.errorMessage)),
          (products) {
        homeProducts = products;
        emit(GetProductsSuccessState(products));
      },
    );
  }

  List<CategoryModel> allCategories = [];
  getCategories() async {
     emit(GetCategoriesLoadingState());
     var data = await homeRepo.getCategories();
     data.fold(
           (error) => emit(GetCategoriesErrorState(error.errorMessage)),
           (categories) {
         allCategories = categories;
         emit(GetCategoriesSuccessState(categories));
       },
     );
  }
}
