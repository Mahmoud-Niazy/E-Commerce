import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api_services/api_services.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/favourites/data/repos/favourites_repo.dart';
import 'package:ecommerce/features/home/data/models/product_model.dart';

class FavouritesRepoImp extends FavouritesRepo {
  final ApiServices apiServices;

  FavouritesRepoImp(
    this.apiServices,
  );

  @override
  Future<Either<Failure, List<ProductModel>>> getFavourites() async {
    try {
      var response = await apiServices.getData(path: 'favorites');
      if (response['status'] == true) {
        List<ProductModel> favourites = [];
        response['data']['data'].forEach((favourite) {
          favourites.add(ProductModel.fromJson(favourite['product']));
        });
        return right(favourites);
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
  Future<Either<Failure, void>> addOrRemoveFavourite({
    required int productId,
  }) async {
    try {
      var response = await apiServices.postData(
        path: 'favorites',
        data: {
          'product_id': productId,
        },
      );
      if (response.data['status'] != true) {
        throw (response.data['message'],);
      }
      return right(null);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }
}
