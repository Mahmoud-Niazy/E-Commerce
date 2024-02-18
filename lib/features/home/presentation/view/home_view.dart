import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:ecommerce/core/app_styles/app_styles.dart';
import 'package:ecommerce/core/widgets/custom_icon_button.dart';
import 'package:ecommerce/core/widgets/custom_text_button.dart';
import 'package:ecommerce/core/widgets/shake_transition.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/carousel_widget.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/grid_view_widget.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/list_of_categories_widget.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).Discover,
                      style: AppStyles.style25,
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black12,
                            ),
                          ),
                          child: CustomIconButton(
                            onPressed: () {},
                            icon: Icons.shopping_cart_outlined,
                          ),
                        ),
                        ShakeTransition(
                          duration: const Duration(
                            seconds: 2,
                          ),
                          axis: Axis.vertical,
                          offset: -20,
                          child: Container(
                            padding: EdgeInsets.all(screenSize.height * .007),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppConstance.primaryColor,
                            ),
                            child: const Center(
                              child: Text(
                                '0',
                                style: AppStyles.style13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * .03,
                ),
                const SearchWidget(),
                SizedBox(
                  height: screenSize.height * .03,
                ),
                const CarouselWidget(),
                SizedBox(
                  height: screenSize.height * .03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style: AppStyles.style20Bold,
                    ),
                    CustomTextButton(
                      title: 'See All',
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * .03,
                ),
                const ListOfCategoriesWidget(),
                SizedBox(
                  height: screenSize.height * .03,
                ),
                const GridViewWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
