import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../home/data/models/product_model.dart';

abstract class CartRepo {
  Future<Either<Failure, List<ProductModel>>> getCartProducts();

  Future<Either<Failure, void>> addOrRemoveCartProduct({
    required int productId,
});

  Future<Either<Failure,void>> makePayment({
    required String amount ,
    required String currency ,
    required String customerStripeId,

  });
}
