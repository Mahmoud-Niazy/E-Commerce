import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../../core/widgets/shake_transition.dart';
import '../../manager/home_cubit/home_cubit.dart';
import '../../manager/home_cubit/home_states.dart';
import 'category_item.dart';

class ListOfCategoriesWidget extends StatelessWidget {
  const ListOfCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
          previous != current &&
          (current is GetCategoriesSuccessState ||
              current is SelectSpecificCategoryState ||
              current is SelectAllCategoriesState),
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        if (state is GetCategoriesErrorState) {
          return Center(
            child: Text(
              state.error,
            ),
          );
        }
        if (state is GetCategoriesLoadingState) {
          return const CustomCircularProgressIndicator();
        }
        return SizedBox(
          height: 45,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ShakeTransition(
                  duration: const Duration(seconds: 3),
                  offset: 250,
                  child: GestureDetector(
                    onTap: () {
                      cubit.colorAllProductCategory();
                      cubit.getAllProducts();
                    },
                    child: CategoryItem(
                      isForAll: true,
                      isSelected: cubit.isAllProductsShown,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ShakeTransition(
                      duration: Duration(seconds: 4 + index),
                      offset: 250,
                      child: GestureDetector(
                        onTap: () {
                          cubit.colorSpecificCategory(index);
                          cubit.getProductsSpecificInCategory(
                              categoryId: cubit.allCategories[index].id);
                        },
                        child: CategoryItem(
                            isSelected: cubit.isAllProductsShown
                                ? false
                                : cubit.currentIndex == index
                                    ? true
                                    : false,
                            categoryModel: cubit.allCategories[index]),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: cubit.allCategories.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
