import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api_services/api_services.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/profile/data/models/user_model.dart';
import 'package:ecommerce/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImp extends ProfileRepo {
  final ApiServices apiServices;

  ProfileRepoImp(this.apiServices);

  @override
  Future<Either<Failure, UserModel>> getUserData() async {
    try {
      var response = await apiServices.getData(path: 'profile');
      if (response['status'] != true) {
        throw ('error');
      }
      UserModel userData = UserModel.fromJson(response['data']);
      return right(userData);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUserData({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String image,
  }) async {
    try {
      var response = await apiServices.putData(
        path: 'update-profile',
        data: {
          "name": name,
          'email': email,
          "phone": phone,
          "password": password,
          "image": image,
        },
      );

      if (response.data['status'] != true) {
        throw (response.data['message']);
      }
      UserModel userData = UserModel.fromJson(response.data['data']);
      return right(userData);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }
}
