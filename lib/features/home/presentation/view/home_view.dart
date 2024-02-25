import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:ecommerce/core/app_styles/app_styles.dart';
import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/core/widgets/custom_icon_button.dart';
import 'package:ecommerce/core/widgets/custom_text_button.dart';
import 'package:ecommerce/core/widgets/shake_transition.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_states.dart';
import 'package:ecommerce/features/cart/presentation/view/cart_view.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/carousel_widget.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/grid_view_widget.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/list_of_categories_widget.dart';
import 'package:ecommerce/core/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../layout/presentation/manager/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';

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
                            onPressed: () {
                              navigate(
                                context: context,
                                screen: const CartView(),
                              );
                            },
                            icon: Icons.shopping_cart_outlined,
                          ),
                        ),
                        BlocBuilder<CartCubit, CartStates>(
                          builder: (context, state) {
                            return ShakeTransition(
                              duration: const Duration(
                                seconds: 3,
                              ),
                              axis: Axis.vertical,
                              offset: -20,
                              child: Container(
                                padding:
                                    EdgeInsets.all(screenSize.height * .007),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppConstance.primaryColor,
                                ),
                                child: Center(
                                  child: Text(
                                    '${CartCubit.get(context).cartProductsCount}',
                                    style: AppStyles.style13,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * .03,
                ),
                SearchWidget(
                  onTap: () {
                    BlocProvider.of<BottomNavigationBarCubit>(context)
                        .toggle(1);
                  },
                  readOnly: true,
                ),
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
                     Text(
                      S.of(context).Categories,
                      style: AppStyles.style20Bold,
                    ),
                    CustomTextButton(
                      title: S.of(context).SeeAll,
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
