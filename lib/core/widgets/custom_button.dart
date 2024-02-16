import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:flutter/material.dart';

import '../app_styles/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isButtonWhite;

  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isButtonWhite = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isButtonWhite ? Colors.white : AppConstance.primaryColor,
          borderRadius: BorderRadius.circular(5),
          border: isButtonWhite
              ? Border.all(
                  color: Colors.black,
                  width: 1,
                )
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.style20Bold.copyWith(
                color: isButtonWhite ? Colors.black : Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
