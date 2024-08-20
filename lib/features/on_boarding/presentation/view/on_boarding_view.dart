import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/core/widgets/custom_icon_button.dart';
import 'package:ecommerce/core/widgets/custom_text_button.dart';
import 'package:ecommerce/features/on_boarding/presentation/manager/page_indicator_cubit/page_indicator_cubit.dart';
import 'package:ecommerce/features/on_boarding/presentation/view/widgets/page_indicator.dart';
import 'package:ecommerce/features/on_boarding/presentation/view/widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/app_assets/app_assets.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/presentation/view/login_view.dart';
import '../../data/page_view_model.dart';
import '../manager/page_indicator_cubit/page_indicator_states.dart';

class OnBoardingView extends StatelessWidget {
  static PageController pageController = PageController();

  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List<PageViewModel> pageViewData = [
      PageViewModel(
        title: S.of(context).onBoarding1,
        image: AppAssets.onBoarding4,
      ),
      PageViewModel(
        title: S.of(context).onBoarding2,
        image: AppAssets.onBoarding1,
      ),
      PageViewModel(
        title: S.of(context).onBoarding4,
        image: AppAssets.onBoarding5,
      ),
      PageViewModel(
        title: S.of(context).onBoarding3,
        image: AppAssets.onBoarding3,
      ),
    ];

    return BlocProvider(
      create: (context) => PageIndicatorCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            CustomTextButton(
              title: S.of(context).skip,
              onPressed: () {
                navigateAndRemoveUntil(
                  context: context,
                  screen: const LoginView(),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * .08,
              left: screenSize.width * .05,
              right: screenSize.width * .05,
              bottom: screenSize.height * .01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return PageViewItem(
                        pageViewModel: pageViewData[index],
                      );
                    },
                    itemCount: pageViewData.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PageIndicator(
                      itemCount: pageViewData.length,
                    ),
                    BlocBuilder<PageIndicatorCubit, PageIndicatorStates>(
                      builder: (context, state) {
                        var cubit = PageIndicatorCubit.get(context);
                        if (cubit.currentIndex == pageViewData.length - 1) {
                          return CustomTextButton(
                            title: S.of(context).Next,
                            onPressed: () {
                              navigateAndRemoveUntil(
                                context: context,
                                screen: const LoginView(),
                              );
                            },
                          );
                        }
                        return CustomIconButton(
                          onPressed: () {
                            if (cubit.currentIndex < pageViewData.length - 1) {
                              cubit.goToNextPage();

                              pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.linear,
                              );
                            }
                          },
                          icon: FontAwesomeIcons.arrowRight,
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
