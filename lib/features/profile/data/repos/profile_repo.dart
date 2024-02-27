import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure,UserModel>>getUserData();
}