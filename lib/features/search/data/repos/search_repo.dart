import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../../home/data/models/product_model.dart';

abstract class SearchRepo {
  Future<Either<Failure,List<ProductModel>>>search({
    required String text,
});
}