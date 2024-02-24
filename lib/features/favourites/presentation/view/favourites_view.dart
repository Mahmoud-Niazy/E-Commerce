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
                 Text(
                  S.of(context).MyFavourites,
                  style:  AppStyles.style20Bold,
                ),
                SizedBox(
                  height: screenSize.height *.04,
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
