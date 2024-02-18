import 'package:flutter/material.dart';

import '../../../../../core/app_styles/app_styles.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFF1F1F1),
      ),
      child: const Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: AppStyles.style15Grey,
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(
            Icons.search,
            color: Colors.black54,
            size: 25,
          ),
        ],
      ),
    );
  }
}
