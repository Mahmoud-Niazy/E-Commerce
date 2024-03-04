import 'package:ecommerce/features/home/presentation/view/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../manager/home_cubit/home_cubit.dart';
import '../../manager/home_cubit/home_states.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
          previous != current &&
          (current is GetProductsSuccessState ||
              current is GetProductsLoadingState),
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        if (state is GetProductsLoadingState) {
          return const CustomCircularProgressIndicator();
        }
        if (state is GetCategoriesErrorState) {
          return Center(
            child: Text(
              state.error,
            ),
          );
        }
        return GridView.count(
          shrinkWrap: true,
          childAspectRatio: 1 / 1.4,
          crossAxisSpacing: screenSize.width * .03,
          mainAxisSpacing: screenSize.height * .015,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: cubit.homeProducts.map((product) {
            // return ProductItem(
            //   productModel: product,
            // );

            // offset: 250,
            // duration: const Duration(
            //   seconds:  3 ,
            // ),
            return ProductItem(
              productModel: product,
            );
          }).toList(),
        );
      },
    );
  }
}
