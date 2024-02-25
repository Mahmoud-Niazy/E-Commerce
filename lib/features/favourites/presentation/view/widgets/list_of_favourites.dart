import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../../core/widgets/custom_divider.dart';
import '../../../../../core/widgets/shake_transition.dart';
import '../../manager/favourites_cubit/favourites_cubit.dart';
import '../../manager/favourites_cubit/favourites_states.dart';
import 'favourites_item.dart';

class ListOfFavourites extends StatelessWidget {
  const ListOfFavourites({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesStates>(
      buildWhen: (previous, current) =>
          previous != current &&
          (current is GetFavouritesSuccessfullyState ||
              current is GetFavouritesLoadingState ||
              current is AddFavouriteState ||
              current is RemoveFavouriteState),
      builder: (context, state) {
        if (state is GetFavouritesLoadingState) {
          return const CustomCircularProgressIndicator();
        }
        if (state is GetFavouritesErrorState) {
          return Center(
            child: Text(
              state.error,
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ShakeTransition(
              duration: Duration(
                seconds: 1 * index + 2,
              ),
              child: FavouritesItem(
                  product: FavouritesCubit.get(context).allFavourites[index]),
            );
          },
          separatorBuilder: (context, index) {
            return const CustomDivider();
          },
          itemCount: FavouritesCubit.get(context).allFavourites.length,
        );
      },
    );
  }
}
