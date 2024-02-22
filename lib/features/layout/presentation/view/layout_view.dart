import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:ecommerce/features/layout/presentation/manager/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../manager/bottom_navigation_bar_cubit/bottom_navigation_bar_states.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarStates>(
      builder: (context, state) {
        var cubit = BottomNavigationBarCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            selectedItemColor: AppConstance.primaryColor,
            unselectedItemColor: Colors.black26,
            onTap: (index) {
              cubit.toggle(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 25,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.heart,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
