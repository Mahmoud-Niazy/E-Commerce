import 'package:ecommerce/core/app_assets/app_assets.dart';
import 'package:ecommerce/core/cache_helper/cache_helper.dart';
import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/core/widgets/shake_transition.dart';
import 'package:ecommerce/features/layout/presentation/view/layout_view.dart';
import 'package:ecommerce/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        navigateAndRemoveUntil(
          context: context,
          screen: CacheHelper.getData(key: 'token') != null ? const LayoutView() : const OnBoardingView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: AppConstance.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShakeTransition(
              axis: Axis.vertical,
              child: Image.asset(
                          AppAssets.logo,
                          height: screenSize.height * .5,
                          width: screenSize.width * .6,
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
