import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/features/cart/presentation/view/recepit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_styles/app_styles.dart';
import '../../../../../core/cache_helper/cache_helper.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../../core/widgets/custom_divider.dart';
import '../../../../../core/widgets/shake_transition.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/cart_cubit/cart_cubit.dart';
import '../../manager/cart_cubit/cart_states.dart';
import 'cart_item.dart';

class CartProductsList extends StatelessWidget {
  const CartProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocBuilder<CartCubit, CartStates>(
      buildWhen: (previous, current) =>
          previous != current &&
              (current is GetCartProductsSuccessfullyState ||
                  current is GetCartProductsLoadingState ||
                  current is IncreaseCountState ||
                  current is DecreaseCountState) ||
          current is AddCartProductState ||
          current is RemoveCartProductState ||
          !(previous is RemoveCartProductState &&
              current is GetCartProductsSuccessfullyState),
      builder: (context, state) {
        if (state is GetCartProductsLoadingState) {
          return const CustomCircularProgressIndicator();
        }
        if (state is GetCartProductsErrorState) {
          return Center(
            child: Text(
              state.error,
            ),
          );
        }
        return Expanded(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: screenSize.height * 0.15,
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ShakeTransition(
                      duration: Duration(
                        seconds: 2 * index + 1,
                      ),
                      child: CartItem(
                        product: CartCubit.get(context).cartProducts[index],
                        index: index,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const CustomDivider();
                  },
                  itemCount: CartCubit.get(context).cartProducts.length,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).TotalPrice,
                            style: AppStyles.style18,
                          ),
                          Text(
                            '${CartCubit.get(context).calcTotalPrice()} \$',
                            style: AppStyles.style20Bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenSize.height * .01,
                      ),
                      BlocConsumer<CartCubit, CartStates>(
                        listener: (context, state) {
                          if (state is PaymentSuccessState) {
                            navigateAndRemoveUntil(
                              context: context,
                              screen: const PaymentReceiptView(),
                            );
                          }
                        },
                        builder: (context, state) {
                          if(state is PaymentLoadingState){
                            return const CustomCircularProgressIndicator();
                          }
                          return CustomButton(
                            onPressed: () async {
                              CartCubit.get(context).makePayment(
                                amount:
                                    (CartCubit.get(context).calcTotalPrice() *
                                            100)
                                        .toString(),
                                currency: 'usd',
                                customerStripeId: await CacheHelper.getData(
                                        key: 'customerStripeId') ??
                                    '',
                              );
                            },
                            title: S.of(context).Checkout,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
