import 'package:flutter/material.dart';

class CheckCircle extends StatelessWidget{
  const CheckCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 0,
      right: 0,
      top: -50,
      child: CircleAvatar(
        backgroundColor: Color(0XFFEDEDED),
        radius: 50,
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.check,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}