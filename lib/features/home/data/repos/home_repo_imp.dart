import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api_services/api_services.dart';
import 'package:ecommerce/core/failure/failure.dart';
import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import 'home_repo.dart';

class HomeRepoImp extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImp(this.apiServices);

  @override
  Future<Either<Failure, List<BannerModel>>> getBanners() async {
    try {
      var response = await apiServices.getData(path: 'home');
      if (response['status'] == true) {
        List<BannerModel> banners = [];
        response['data']['banners'].forEach((banner) {
          banners.add(BannerModel.fromJson(banner));
        });
        return right(banners);
      } else {
        throw (response.data['message'],);
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      var response = await apiServices.getData(path: 'home');
      if (response['status'] == true) {
        List<ProductModel> products = [];
        response['data']['products'].forEach((product) {
          products.add(ProductModel.fromJson(product));
        });
        return right(products);
      } else {
        throw (response.data['message'],);
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      var response = await apiServices.getData(path: 'categories');
      if (response['status'] == true) {
        List<CategoryModel> categories = [];
        response['data']['data'].forEach((category) {
          categories.add(CategoryModel.fomJson(category));
        });
        return right(categories);
      } else {
        throw (response.data['message'],);
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsSpecificInCategory({
    required int categoryId,
  }) async {
    try {
      var response = await apiServices.getData(path: 'products?category_id=$categoryId');
      if (response['status'] == true) {
        List<ProductModel> products = [];
        response['data']['data'].forEach((product) {
          products.add(ProductModel.fromJson(product));
        });
        return right(products);
      } else {
        throw (response.data['message'],);
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }
}
