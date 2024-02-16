import 'package:ecommerce/features/on_boarding/data/page_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/app_styles/app_styles.dart';

class PageViewItem extends StatelessWidget {
  final PageViewModel pageViewModel;

  const PageViewItem({
    super.key,
    required this.pageViewModel,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pageViewModel.title,
                style: AppStyles.styles30Bold,
              ),
              SizedBox(height: screenSize.height * .15),
              Center(
                child: Image.asset(
                  pageViewModel.image,
                  fit: BoxFit.cover,
                  height: screenSize.height * .3,
                ),
              ),
              SizedBox(height: screenSize.height * .15),
            ],
          ),
        ],
      ),
    );
  }
}
