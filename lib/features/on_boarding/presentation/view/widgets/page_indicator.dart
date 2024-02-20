import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:ecommerce/features/on_boarding/presentation/manager/page_indicator_cubit/page_indicator_cubit.dart';
import 'package:ecommerce/features/on_boarding/presentation/manager/page_indicator_cubit/page_indicator_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//ignore: must_be_immutable
class PageIndicator extends StatelessWidget {
  final int itemCount ;

  const PageIndicator({
    super.key,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocBuilder<PageIndicatorCubit, PageIndicatorStates>(
      builder: (context, state) {
        return SizedBox(
          height: screenSize.height * .02,
          width: 55,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              height: 8,
              width: 10,
              decoration: BoxDecoration(
                color: PageIndicatorCubit.get(context).currentIndex == index
                    ? AppConstance.primaryColor
                    : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 5,
            ),
            itemCount: itemCount,
          ),
        );
      },
    );
  }
}
