import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/features/home/presentation/view/product_details_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/app_constance/app_constance.dart';
import '../../../../../core/app_styles/app_styles.dart';
import '../../../../../core/widgets/circular_button.dart';
import '../../../../home/data/models/product_model.dart';

class SearchItem extends StatelessWidget {
  final ProductModel product;

  const SearchItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.style18,
                ),
                SizedBox(
                  height: screenSize.height * .03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${product.price}',
                      style: AppStyles.style20Bold,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CircularButton(
                              icon: Icons.favorite,
                              onPressed: () {},
                              iconColor: Colors.red,
                            ),
                          ),
                          Expanded(
                            child: CircularButton(
                              icon: Icons.shopping_cart,
                              onPressed: () {},
                              iconColor: AppConstance.primaryColor,
                            ),
                          ),
                        ],
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
  }
}
