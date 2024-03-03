import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api_services/api_services.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/core/payment_service/payment_service.dart';
import 'package:ecommerce/features/cart/data/repos/cart_repo.dart';
import 'package:ecommerce/features/home/data/models/product_model.dart';

class CartRepoImp extends CartRepo {
  final ApiServices apiServices;
  PaymentService paymentService = PaymentService();

  CartRepoImp(
    this.apiServices,
  );

  @override
  Future<Either<Failure, List<ProductModel>>> getCartProducts() async {
    try {
      var response = await apiServices.getData(path: 'carts');
      if (response['status'] == true) {
        List<ProductModel> cart = [];
        response['data']['cart_items'].forEach((product) {
          cart.add(ProductModel.fromJson(product['product']));
        });
        return right(cart);
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
  Future<Either<Failure, void>> addOrRemoveCartProduct({
    required int productId,
  }) async {
    try {
      var response = await apiServices.postData(
        path: 'carts',
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

  @override
  Future<Either<Failure,void>> makePayment({
    required String amount,
    required String currency,
    required String customerStripeId,
  }) async{
    try{
     await paymentService.makePayment(
        amount: amount,
        currency: currency,
       customerStripeId: customerStripeId,
      );
     return right(null);
    }
    catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }
}
