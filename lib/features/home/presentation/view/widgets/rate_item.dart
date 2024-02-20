import 'package:flutter/material.dart';

import '../../../../../core/app_styles/app_styles.dart';

class RateItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;

  const RateItem({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: AppStyles.style17,
          ),
        ],
      ),
    );
  }
}
