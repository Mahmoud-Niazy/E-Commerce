import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget{
  final IconData icon ;
  final Color? color;
  final void Function()? onPressed ;

  const CustomIconButton({super.key,
    required this.onPressed,
    required this.icon,
    this.color = AppConstance.primaryColor,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
      ),
      onPressed: onPressed,
      color: color,
    );
  }
}