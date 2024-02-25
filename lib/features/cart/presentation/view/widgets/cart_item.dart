import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/core/widgets/custom_icon_button.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_states.dart';
import 'package:ecommerce/features/home/presentation/view/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_constance/app_constance.dart';
import '../../../../../core/app_styles/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/data/models/product_model.dart';

//ignore: must_be_immutable
class CartItem extends StatelessWidget {
  final ProductModel product;
  int index;

  CartItem({
    super.key,
    required this.product,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            navigate(
              context: context,
              screen: ProductDetailsView(
                product: product,
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.network(
                    product.image,
                    height: screenSize.height * .2,
                    width: screenSize.width * .3,
                    fit: BoxFit.cover,
                  ),
                  if (product.discount != 0)
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration:
                          const BoxDecoration(color: AppConstance.primaryColor),
                      child: Text(
                        S.of(context).Discount,
                        style: AppStyles.style13,
                      ),
                    ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenSize.width * .4,
                          child: Text(
                            product.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.style18,
                          ),
                        ),
                        CustomIconButton(
                          color: Colors.black38,
                          onPressed: () {
                            CartCubit.get(context).addOrRemoveCartProduct(
                              product: product,
                            );
                            // HomeCubit.get(context).getAllProducts();
                          },
                          icon: Icons.clear,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * .03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${product.price * CartCubit.get(context).everyProductCount[index]}',
                          style: AppStyles.style20Bold,
                        ),
                        Container(
                          width: screenSize.width * .1,
                          height: screenSize.height * .05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (CartCubit.get(context)
                                      .everyProductCount[index] >
                                  1) {
                                CartCubit.get(context).decreaseCount(index);
                              }
                            },
                            child: const Icon(
                              Icons.remove,
                            ),
                          ),
                        ),
                        Text(
                          '${CartCubit.get(context).everyProductCount[index]}',
                          style: AppStyles.style18,
                        ),
                        Container(
                          width: screenSize.width * .1,
                          height: screenSize.height * .05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: AppConstance.primaryColor),
                          ),
                          child: InkWell(
                            onTap: () {
                              CartCubit.get(context).increaseCount(index);
                            },
                            child: const Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
