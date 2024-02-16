import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/auth/data/models/user_registration_input_model.dart';

import '../../../../core/failure/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> register({
    required UserRegistrationInputModel userData,
  });
}
