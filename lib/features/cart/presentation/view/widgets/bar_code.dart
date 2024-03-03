import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/app_styles/app_styles.dart';


class BarCode extends StatelessWidget{
  const BarCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            FontAwesomeIcons.barcode,
            size: 100,
          ),
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.green,
              ),
            ),
            child: Text(
              'PAID',
              style: AppStyles.style25.copyWith(
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}