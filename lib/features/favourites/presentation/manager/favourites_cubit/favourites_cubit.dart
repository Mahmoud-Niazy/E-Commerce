import 'package:ecommerce/features/favourites/presentation/manager/favourites_cubit/favourites_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../data/repos/favourites_repo.dart';

class FavouritesCubit extends Cubit<FavouritesStates> {
  final FavouritesRepo favouritesRepo;
  List<ProductModel> allFavourites = [];
  List<int> favouriteProductsIds = [];

  FavouritesCubit(
    this.favouritesRepo,
  ) : super(
          FavouritesInitialState(),
        );

  static FavouritesCubit get(context) => BlocProvider.of<FavouritesCubit>(context);

  getFavourites() async {
    favouriteProductsIds =[];
    emit(GetFavouritesLoadingState());
    var data = await favouritesRepo.getFavourites();

    data.fold(
      (error) => emit(GetFavouritesErrorState(
        error.errorMessage,
      )),
      (favourites) {
        allFavourites = favourites;
        for (var element in allFavourites) {
          favouriteProductsIds.add(element.id);
        }
        emit(GetFavouritesSuccessfullyState(
        favourites,
      ));
      },
    );
  }

  addOrRemoveFavourite({
    required ProductModel product,
  }) async {
    if(favouriteProductsIds.contains(product.id)){
      favouriteProductsIds.remove(product.id);
      allFavourites.remove(product);
      emit(RemoveFavouriteState());
    }
    else{
      favouriteProductsIds.add(product.id);
      allFavourites.add(product);
      emit(AddFavouriteState());
    }
    var data = await favouritesRepo.addOrRemoveFavourite(productId: product.id);
    data.fold(
      (error) => emit(AddOrRemoveFavouriteErrorState(error.errorMessage,),),
      (success)async {
       await getFavourites();
        emit(ChangeFavouritesSuccessState(),);
      },
    );
  }
}
