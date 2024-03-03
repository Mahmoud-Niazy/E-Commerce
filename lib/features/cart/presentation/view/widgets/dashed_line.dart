import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10 + 20,
      left: 10 + 20,
      bottom: MediaQuery.of(context).size.height * .2 + 20,
      child: Row(
        children: List.generate(
          20,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Container(
                height: 2,
                color: const Color(0XFFB8B8B8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
