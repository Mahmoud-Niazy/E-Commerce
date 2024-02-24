import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../app_styles/app_styles.dart';

class SearchWidget extends StatelessWidget {
  final bool readOnly ;
  final void Function()? onTap ;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller ;
  const SearchWidget({
    super.key,
    this.controller,
    required this.onTap,
    required this.readOnly,
    this.onSubmitted ,
  });

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
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: onSubmitted,
              readOnly: readOnly,
              onTap: onTap,
              decoration: InputDecoration(
                hintText: S.of(context).Search,
                hintStyle: AppStyles.style15Grey,
                border: InputBorder.none,
              ),
            ),
          ),
          const Icon(
            Icons.search,
            color: Colors.black54,
            size: 25,
          ),
        ],
      ),
    );
  }
}
