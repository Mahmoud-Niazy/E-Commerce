import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api_services/api_services.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/profile/data/models/user_model.dart';
import 'package:ecommerce/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImp extends ProfileRepo{
  final ApiServices apiServices;
  ProfileRepoImp(this.apiServices);
  @override
  Future<Either<Failure, UserModel>> getUserData() async{
    try{
      var response = await apiServices.getData(endPoint: 'profile');
      if(response['status'] != true){
        throw('error');
      }
      UserModel userData = UserModel.fromJson(response['data']);
      return right(userData);
    }
    catch(error){
      if(error is DioException){
        return left(ServerFailure.fromDioException(error));
      }
      else{
        return left(Failure(error.toString()));
      }
    }
  }
  
}