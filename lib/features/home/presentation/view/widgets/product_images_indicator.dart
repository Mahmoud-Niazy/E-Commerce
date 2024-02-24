import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class ProductImagesPageIndicator extends StatefulWidget {
  static PageController pageController = PageController();
  final List<String>? images ;
  // final int itemCount ;
  final String? image ;
  int currentIndex = 0  ;

    ProductImagesPageIndicator({
    super.key,
    // required this.itemCount,
      this.images,
      this.image,
      this.currentIndex =0,
  });

  @override
  State<ProductImagesPageIndicator> createState() => _ProductImagesPageIndicatorState();
}

class _ProductImagesPageIndicatorState extends State<ProductImagesPageIndicator> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    if (widget.images!.isNotEmpty ){
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                widget.currentIndex = index;
              });
            },
            controller: ProductImagesPageIndicator.pageController,
            itemBuilder: (context, index) {
              return Image.network(
                widget.images![index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
            itemCount: widget.images!.length,
          ),
          SizedBox(
            height: screenSize.height * .02,
            width: 55,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  Container(
                    height: 8,
                    width: 10,
                    decoration: BoxDecoration(
                      color: widget.currentIndex == index
                          ? AppConstance.primaryColor
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
              separatorBuilder: (context, index) =>
              const SizedBox(
                width: 5,
              ),
              itemCount: widget.images!.length,
            ),
          ),
        ],
      );
  }
    else{
      return Image.network(
        widget.image!,
        fit: BoxFit.cover,
        width: double.infinity,
      );
    }
  }
}
