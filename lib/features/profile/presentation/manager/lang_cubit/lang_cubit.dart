import 'package:ecommerce/features/profile/presentation/manager/lang_cubit/lang_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cache_helper/cache_helper.dart';

class LangCubit extends Cubit<LangStates>{

  LangCubit() : super(LangInitialState());

  static LangCubit get(context) => BlocProvider.of<LangCubit>(context);

  toggleBetweenLanguages(){

    CacheHelper.saveData(key: 'langAr' ,value:  !(CacheHelper.getData(key: 'langAr') ?? false));
    emit(ToggleBetweenLanguages());
  }
}