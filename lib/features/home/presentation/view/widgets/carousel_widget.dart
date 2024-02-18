import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../manager/home_cubit/home_cubit.dart';
import '../../manager/home_cubit/home_states.dart';

class CarouselWidget extends StatelessWidget{
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
      previous != current && current is GetBannersSuccessState,
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        if (state is GetBannersLoadingState) {
          return const CustomCircularProgressIndicator();
        }
        if (state is GetBannersErrorState) {
          return Center(
            child: Text(
              state.error,
            ),
          );
        }
        return SizedBox(
          height: 200,
          child: CarouselSlider(
            items: cubit
                .allBanners
                .map(
                  (banner) => Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    banner.image,
                  )),
            )
                .toList(),
            options: CarouselOptions(
              height: 400,
              // aspectRatio: 16/9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration:
              const Duration(seconds: 1),
              autoPlayCurve: Curves.linear,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
        );

      },
    );
  }
}