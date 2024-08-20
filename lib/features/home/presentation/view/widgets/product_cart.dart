import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:ecommerce/core/functions/navigation.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../cart/presentation/manager/cart_cubit/cart_cubit.dart';
import '../../../data/models/product_model.dart';

class ProductCart extends StatefulWidget {
  final ProductModel product;

  const ProductCart({
    super.key,
    required this.product,
  });

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation buttonAnimation;
  late Animation animationMovementIn ;
  late Animation<double> animationMovementOut ;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ),
    );
    buttonAnimation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.0,
          0.4,
        ),
      ),
    );

    animationMovementIn = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.4,
          0.7,
        ),
      ),
    );

    animationMovementOut = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.7,
          1.0,
        ),
      ),
    );

    controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        navigatePop(context: context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Material(
          color: Colors.transparent,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Colors.black54,
                  ),
                ),
              ),
              if(animationMovementIn.value != 1)
              Positioned(
                top: screenSize .height*.5 + animationMovementIn.value * screenSize.height *.379,
                width: (screenSize.width *
                    buttonAnimation.value)
                    .clamp(60, screenSize.width),
                left: screenSize.width/2 -(screenSize.width *
                    buttonAnimation.value)
                    .clamp(60, screenSize.width)/2,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(
                    begin: 1,
                    end: 0,
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(
                          0.0, value * screenSize.height * .6),
                      child: child,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: (screenSize.width *
                        buttonAnimation.value)
                        .clamp(60, screenSize.width),
                    height: (screenSize.height *
                        .6 *
                        buttonAnimation.value)
                        .clamp(60, screenSize.height * .6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: const Radius.circular(40),
                        topLeft: const Radius.circular(40),
                        bottomLeft: buttonAnimation.value==1? const Radius.circular(0) : const Radius.circular(40),
                        bottomRight: buttonAnimation.value==1? const Radius.circular(0) : const Radius.circular(40),

                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height:(120*buttonAnimation.value).clamp(20, 120).toDouble(),
                                // height: screenSize.height *.4,
                                width: (120*buttonAnimation.value).clamp(20, 120).toDouble(),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        widget.product.image!,
                                      ),
                                    )),
                              ),
                              if (buttonAnimation.value == 1) ...[
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          widget.product.name!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.black, fontSize: 17),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '\$ ${widget.product.price}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 40 - (animationMovementOut.value *100),
                left: screenSize.width / 2 -
                    (buttonAnimation.value * 160).clamp(60.0, 160.0) /
                        2,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(
                    begin: 1,
                    end: 0,
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(
                          0.0, value * screenSize.height * .6),
                      child: child,
                    );
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        controller.forward();
                        if(!CartCubit.get(context).cartProductsIds.contains(widget.product.id)){
                          CartCubit.get(context).addOrRemoveCartProduct(product: widget.product);
                        }
                      },
                      child: Container(
                        height: 60,
                        width: (buttonAnimation.value * 160)
                            .clamp(60.0, 160.0),
                        decoration: BoxDecoration(
                            color: AppConstance.primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                              if (buttonAnimation.value == 1) ...[
                                const SizedBox(
                                  width: 5,
                                ),
                                 Text(
                                  S.of(context).AddToCart,
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      // child:,
    );
  }
}
