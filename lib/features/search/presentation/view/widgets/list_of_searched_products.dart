import 'package:ecommerce/features/search/presentation/view/widgets/search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../../core/widgets/custom_divider.dart';
import '../../../../../core/widgets/shake_transition.dart';
import '../../manager/search_cubit/search_cubit.dart';
import '../../manager/search_cubit/search_states.dart';

class ListOfSearchedProducts extends StatelessWidget{
  const ListOfSearchedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SearchCubit, SearchStates>(

      builder: (context, state) {
        if (state is SearchLoadingState) {
          return const CustomCircularProgressIndicator();
        }
        if (state is SearchErrorState) {
          return Center(
            child: Text(
              state.error,
            ),
          );
        }
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ShakeTransition(
              duration: Duration(
                seconds: 2*index + 2,
              ),
              child: SearchItem(
                  product: SearchCubit.get(context)
                      .searchedProducts[index]),
            );
          },
          separatorBuilder: (context, index) {
            return const CustomDivider();
          },
          itemCount:
          SearchCubit.get(context).searchedProducts.length,
        );
      },
    );
  }
}