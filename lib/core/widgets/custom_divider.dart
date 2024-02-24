import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget{
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Container(
        height: 1,
        color: Colors.black.withOpacity(.08),
        width: double.infinity,
      ),
    );
  }
}