import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api_services/api_services.dart';
import 'package:ecommerce/core/cache_helper/cache_helper.dart';
import 'package:ecommerce/core/payment_service/payment_service.dart';
import 'package:ecommerce/features/auth/data/models/user_registration_input_model.dart';
import '../../../../core/failure/failure.dart';
import 'auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final ApiServices apiServices;

  AuthRepoImp(this.apiServices);

  @override
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await apiServices.postData(
        path: 'login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.data['status'] == true) {
        String customerStripeId = await PaymentService()
            .createCustomer(name: response.data['data']['name']);
        await CacheHelper.saveData(
          key: 'customerStripeId',
          value: customerStripeId,
        );
        return right(response.data['data']['token']);
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
  Future<Either<Failure, String>> register({
    required UserRegistrationInputModel userData,
  }) async {
    try {
      var response = await apiServices.postData(
        path: 'register',
        data: userData.toJson(),
      );
      if (response.data['status'] == true) {
        return right(response.data['data']['token']);
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
