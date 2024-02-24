import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/features/home/data/models/product_model.dart';
import 'package:ecommerce/features/home/presentation/view/product_details_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_constance/app_constance.dart';
import '../../../../../core/app_styles/app_styles.dart';
import '../../../../../generated/l10n.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;

  const ProductItem({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigate(
          context: context,
          screen: ProductDetailsView(
            product: productModel,
          ),
        );
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                  productModel.image,
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ),
              ),
              if (productModel.discount != 0)
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
          Text(
            productModel.name,
            style: AppStyles.style18Grey,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${productModel.price}',
                style: AppStyles.style17,
              ),
              Text(
                '${productModel.oldPrice}',
                style: AppStyles.style15Grey
                    .copyWith(decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
