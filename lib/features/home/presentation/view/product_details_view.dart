import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/favourites/presentation/manager/favourites_cubit/favourites_cubit.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/product_images_indicator.dart';
import 'package:ecommerce/core/widgets/shake_transition.dart';
import 'package:ecommerce/features/home/data/models/product_model.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/product_cart.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/rate_item.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_styles/app_styles.dart';
import '../../../../generated/l10n.dart';
import '../../../cart/presentation/manager/cart_cubit/cart_states.dart';
import '../../../favourites/presentation/manager/favourites_cubit/favourites_states.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: const Icon(
                null,
              ),
              expandedHeight: screenSize.height * .3,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    ProductImagesPageIndicator(
                      images: product.images,
                      image: product.image,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircularButton(
                            icon: Icons.arrow_back_ios_new,
                            onPressed: () {
                              navigatePop(context: context);
                            },
                          ),
                          Column(
                            children: [
                              BlocBuilder<FavouritesCubit, FavouritesStates>(
                                builder: (context, state) {
                                  return Expanded(
                                    child: CircularButton(
                                      icon: Icons.favorite,
                                      iconColor: FavouritesCubit.get(context)
                                              .favouriteProductsIds
                                              .contains(product.id)
                                          ? Colors.red
                                          : Colors.black26,
                                      onPressed: () {
                                        FavouritesCubit.get(context)
                                            .addOrRemoveFavourite(
                                                product: product);
                                      },
                                    ),
                                  );
                                },
                              ),
                              BlocBuilder<CartCubit, CartStates>(
                                builder: (context, state) {
                                  return Expanded(
                                    child: CircularButton(
                                      icon: Icons.shopping_cart,
                                      iconColor: CartCubit.get(context).cartProductsIds.contains(product.id)
                                          ? AppConstance.primaryColor
                                          : Colors.black26,
                                      onPressed: () {
                                        CartCubit.get(context)
                                            .addOrRemoveCartProduct(
                                          product: product,
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.height * .03,
                        ),
                        ShakeTransition(
                          duration: const Duration(
                            seconds: 1,
                          ),
                          child: Text(
                            product.name,
                            style: AppStyles.style25,
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * .01,
                        ),
                        ShakeTransition(
                          duration: const Duration(
                            seconds: 2,
                          ),
                          child: Row(
                            children: [
                              const RateItem(
                                title: '4.8',
                                icon: Icons.star_rate,
                                iconColor: Colors.yellow,
                              ),
                              SizedBox(
                                width: screenSize.width * .03,
                              ),
                              const RateItem(
                                title: '94 %',
                                icon: Icons.add_reaction,
                                iconColor: AppConstance.primaryColor,
                              ),
                              SizedBox(
                                width: screenSize.width * .03,
                              ),
                              Text(
                                S.of(context).numberOfReviews,
                                style: AppStyles.style15Grey,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * .03,
                        ),
                        ShakeTransition(
                          duration: const Duration(
                            seconds: 3,
                          ),
                          child: Text(
                            S.of(context).Description,
                            style: AppStyles.style20Bold,
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * .01,
                        ),
                        Expanded(
                          child: ShakeTransition(
                            duration: const Duration(
                              seconds: 4,
                            ),
                            child: ExpandableText(
                              product.description,
                              style: AppStyles.style17,
                              expandText: S.of(context).showMore,
                              collapseText: S.of(context).showLess,
                              linkColor: AppConstance.primaryColor,
                              maxLines: 8,
                              animation: true,
                              animationDuration: const Duration(seconds: 4),
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                if (product.oldPrice != null)
                                  Text(
                                    '${product.oldPrice}',
                                    style: AppStyles.style18Grey.copyWith(
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                Text(
                                  '${product.price}',
                                  style: AppStyles.styles30Bold,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: CustomButton(
                                onPressed: () {
                                  navigate(
                                    context: context,
                                    screen: ProductCart(
                                      product: product,
                                    ),
                                  );
                                },
                                title: S.of(context).AddToCart,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
