import 'package:flutter/material.dart';

import '../../../../../core/app_styles/app_styles.dart';


class TotalPriceItem extends StatelessWidget {
  final String price;

  const TotalPriceItem({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         const Text(
          'Total',
          style: AppStyles.style20,
        ),
        Text(
          '\$$price',
          style: AppStyles.style20Bold,
        ),
      ],
    );
  }
}
