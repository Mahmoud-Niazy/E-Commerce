import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/features/cart/presentation/view/widgets/cart_products_list.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_styles/app_styles.dart';
import '../../../../generated/l10n.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularButton(
                    icon: Icons.arrow_back_ios_new,
                    onPressed: () {
                      navigatePop(context: context);
                    },
                  ),
                   Text(
                    S.of(context).MyCart,
                    style: AppStyles.style20Bold,
                  ),
                  CircularButton(
                    icon: Icons.more_horiz,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height * .01,
              ),
              const CartProductsList(),
            ],
          ),
        ),
      ),
    );
  }
}
