import 'package:dartz/dartz.dart';
import '../../../../../core/failure/failure.dart';
import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BannerModel>>> getBanners();

  Future<Either<Failure, List<ProductModel>>> getProducts();

  Future<Either<Failure, List<CategoryModel>>> getCategories();

  Future<Either<Failure,List<ProductModel>>> getProductsSpecificInCategory({
    required int categoryId,
});
}
