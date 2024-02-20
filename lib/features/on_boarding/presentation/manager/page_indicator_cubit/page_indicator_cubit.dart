import 'package:ecommerce/features/on_boarding/presentation/manager/page_indicator_cubit/page_indicator_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageIndicatorCubit extends Cubit<PageIndicatorStates>{

  PageIndicatorCubit(): super(PageIndicatorInitialState());
  static PageIndicatorCubit get(context) => BlocProvider.of<PageIndicatorCubit>(context);


  int currentIndex = 0;
  goToNextPage(){
    currentIndex++;
    emit(NextPageState());
  }


}