import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  final Widget child;

  final Duration duration;

  final double offset;

  final Axis? axis;

  const ShakeTransition({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 3),
    this.axis = Axis.horizontal,
    this.offset = 140,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(
        begin: 1.0,
        end: 0.0,
      ),
      duration: duration,
      builder: (context, value, child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(value * offset, 0)
              : Offset(0, offset * value),
          child: child,
        );
      },
      curve: Curves.elasticOut,
      child: child,
    );
  }
}
