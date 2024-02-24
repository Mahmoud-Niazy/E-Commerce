import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final Color? iconColor ;

  const CircularButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Colors.black26,
            )),
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          size: 20,
          color: iconColor,
        ),
      ),
    );
  }
}
