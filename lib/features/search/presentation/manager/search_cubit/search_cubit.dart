import 'package:ecommerce/features/search/presentation/manager/search_cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/search_repo.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitialState());

  search({
    required String text,
  }) async {
    emit(SearchLoadingState());
    var data = await searchRepo.search(text: text);
    data.fold(
      (error) => emit(SearchErrorState(error.errorMessage)),
      (products) => emit(SearchSuccessState(products)),
    );
  }
}
