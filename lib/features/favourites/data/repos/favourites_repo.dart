import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../../home/data/models/product_model.dart';

abstract class FavouritesRepo{
  Future<Either<Failure,List<ProductModel>>>getFavourites();
  Future<Either<Failure,void>> addOrRemoveFavourite({
    required int productId,
});
}