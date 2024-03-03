import 'package:flutter/material.dart';

import '../../../../../core/app_styles/app_styles.dart';


class PaymentReceiptInfoItem extends StatelessWidget {
  final String title;

  final String value;

  const PaymentReceiptInfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.style18,
        ),
        Text(
          value,
          style: AppStyles.style20Bold,
        ),
      ],
    );
  }
}
