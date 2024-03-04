import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/features/favourites/presentation/view/widgets/list_of_favourites.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_styles/app_styles.dart';
import '../../../../generated/l10n.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).MyFavourites,
                      style: AppStyles.style20Bold,
                    ),
                    CircularButton(
                      icon: Icons.more_horiz,
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * .02,
                ),
                const ListOfFavourites(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
