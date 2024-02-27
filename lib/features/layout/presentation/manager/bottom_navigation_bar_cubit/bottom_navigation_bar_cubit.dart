import 'package:ecommerce/features/favourites/presentation/view/favourites_view.dart';
import 'package:ecommerce/features/home/presentation/view/home_view.dart';
import 'package:ecommerce/features/search/presentation/view/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../profile/presentation/view/profile_view.dart';
import 'bottom_navigation_bar_states.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarStates> {
  BottomNavigationBarCubit()
      : super(
          BottomNavigationBarInitialState(),
        );

  static BottomNavigationBarCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const FavouritesView(),
    const ProfileView(),

  ];
  int currentIndex = 0;

  toggle(int index){
    currentIndex = index;
    emit(BottomNavigationBarToggleState());
  }
}
