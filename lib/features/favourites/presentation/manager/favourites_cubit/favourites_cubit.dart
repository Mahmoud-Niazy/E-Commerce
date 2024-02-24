import 'package:ecommerce/features/favourites/presentation/manager/favourites_cubit/favourites_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../data/repos/favourites_repo.dart';

class FavouritesCubit extends Cubit<FavouritesStates> {
  final FavouritesRepo favouritesRepo;
  List<ProductModel> allFavourites = [];

  FavouritesCubit(
    this.favouritesRepo,
  ) : super(
          FavouritesInitialState(),
        );

  static FavouritesCubit get(context) => BlocProvider.of<FavouritesCubit>(context);

  getFavourites() async {
    emit(GetFavouritesLoadingState());
    var data = await favouritesRepo.getFavourites();

    data.fold(
      (error) => emit(GetFavouritesErrorState(
        error.errorMessage,
      )),
      (favourites) {
        allFavourites = favourites;
        emit(GetFavouritesSuccessfullyState(
        favourites,
      ));
      },
    );
  }

  addOrRemoveFavourite({
    required int productId,
  }) async {
    emit(AddOrRemoveFavouriteLoadingState());
    var data = await favouritesRepo.addOrRemoveFavourite(productId: productId);
    data.fold(
      (error) => emit(AddOrRemoveFavouriteErrorState(error.errorMessage,),),
      (success) => emit(AddOrRemoveFavouriteSuccessfullyState(),),
    );
  }
}
