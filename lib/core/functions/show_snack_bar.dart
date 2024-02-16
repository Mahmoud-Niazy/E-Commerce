import 'package:flutter/material.dart';

showSnackBar({
  required BuildContext context,
  required String label,
  required Color color ,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        label,
      ),
      backgroundColor: color,
    ),
  );
}