import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api_services/api_services.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/home/data/models/product_model.dart';
import 'package:ecommerce/features/search/data/repos/search_repo.dart';

class SearchRepoImp extends SearchRepo {
  final ApiServices apiServices;

  SearchRepoImp(this.apiServices);

  @override
  Future<Either<Failure, List<ProductModel>>> search(
      {required String text}) async {
    try {
      var response = await apiServices.postData(
        path: 'products/search',
        data: {
          'text': text,
        },
      );
      if (response.data['status'] == true) {
      List<ProductModel> products = [];
      response.data['data']['data'].forEach((product) {
        products.add(ProductModel.fromJson(product));
      });
      return right(products);
    }
      else {
        throw ('Error');
      }
    }

    catch(error){
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }
}
