import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> getUserData();

  Future<Either<Failure, UserModel>> updateUserData({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String image,
  });
}
