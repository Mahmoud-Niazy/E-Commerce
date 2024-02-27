import 'package:flutter/material.dart';

import '../../../../../core/app_constance/app_constance.dart';
import '../../../../../core/app_styles/app_styles.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final Color borderColor;

  final IconData icon;
  final Color iconColor;

  const SettingItem({
    super.key,
    required this.icon,
    this.iconColor = AppConstance.primaryColor,
    required this.title,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * .12,
      width: screenSize.width * .35,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.style18Grey,
          ),
        ],
      ),
    );
  }
}
