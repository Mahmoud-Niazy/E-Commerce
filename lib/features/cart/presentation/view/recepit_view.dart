import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/view/widgets/bar_code.dart';
import 'package:ecommerce/features/cart/presentation/view/widgets/check_circle.dart';
import 'package:ecommerce/features/cart/presentation/view/widgets/dashed_line.dart';
import 'package:ecommerce/features/cart/presentation/view/widgets/payment_receipt_info_item.dart';
import 'package:ecommerce/features/cart/presentation/view/widgets/total_price_item.dart';
import 'package:ecommerce/features/layout/presentation/view/layout_view.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_styles/app_styles.dart';

class PaymentReceiptView extends StatelessWidget {
  const PaymentReceiptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            navigateAndRemoveUntil(
              context: context,
              screen: const LayoutView(),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
      ),
      body: Transform.translate(
        offset: const Offset(0, -15),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFEDEDED),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50 + 15,
                  left: 23,
                  right: 23,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        'Thank You',
                        style: AppStyles.style25,
                      ),
                      Text(
                        'Your transaction was success',
                        style: AppStyles.style20.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      PaymentReceiptInfoItem(
                        title: 'Date',
                        value: DateTime.now().toString().split(' ')[0],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PaymentReceiptInfoItem(
                        title: 'Time',
                        value:
                            '${TimeOfDay.now().hour}:${TimeOfDay.now().minute} ',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const PaymentReceiptInfoItem(
                        title: 'To',
                        value: 'Mahmoud',
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 40,
                      ),
                      TotalPriceItem(
                        price: '${CartCubit.get(context).calcTotalPrice()}',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const CheckCircle(),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .2,
                left: -20,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .2,
                right: -20,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
              const DashedLine(),
              const BarCode(),
            ],
          ),
        ),
      ),
    );
  }
}
