import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:flutter/material.dart';
import '../app_styles/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed ;


  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: AppStyles.style17.copyWith(
          color: AppConstance.primaryColor,
        ),
      ),
    );
  }
}