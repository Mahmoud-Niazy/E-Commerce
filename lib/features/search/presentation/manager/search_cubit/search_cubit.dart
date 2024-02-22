import 'package:ecommerce/features/home/data/models/product_model.dart';
import 'package:ecommerce/features/search/presentation/manager/search_cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/search_repo.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of<SearchCubit>(context);

  List<ProductModel> searchedProducts = [] ;
  search({
    required String text,
  }) async {
    searchedProducts =[];
    emit(SearchLoadingState());
    var data = await searchRepo.search(text: text);
    data.fold(
      (error) => emit(SearchErrorState(error.errorMessage)),
      (products) {
        searchedProducts = products;
        emit(SearchSuccessState(products));
      },
    );
  }
}
