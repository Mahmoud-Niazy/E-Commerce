import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:ecommerce/features/profile/presentation/view/widgets/setting_item.dart';
import 'package:ecommerce/features/profile/presentation/view/widgets/user_data_item.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: screenSize.height * .45,
                  child: const UserDataItem(),
                ),
              ),
              SizedBox(
                height: screenSize.height * .1,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width * .1),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingItem(
                          icon: Icons.logout,
                          title: 'Logout',
                          iconColor: Colors.red,
                          borderColor: Colors.black26,
                        ),
                        SettingItem(
                          icon: Icons.edit,
                          title: 'Edit',
                          borderColor: AppConstance.primaryColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * .02,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingItem(
                          icon: Icons.shopping_cart_outlined,
                          title: 'Purchases',
                          borderColor: AppConstance.primaryColor,
                        ),
                        SettingItem(
                          icon: Icons.info_outline,
                          title: 'Info',
                          borderColor: Colors.black26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
