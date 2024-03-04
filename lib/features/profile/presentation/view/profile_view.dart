import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:ecommerce/core/cache_helper/cache_helper.dart';
import 'package:ecommerce/features/auth/presentation/view/login_view.dart';
import 'package:ecommerce/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:ecommerce/features/profile/presentation/view/widgets/setting_item.dart';
import 'package:ecommerce/features/profile/presentation/view/widgets/user_data_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../generated/l10n.dart';
import 'edit_profile_view.dart';

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async{
                            await CacheHelper.removeData(key: 'token',);
                            navigateAndRemoveUntil(
                              context: context,
                              screen: const LoginView(),
                            );
                          },
                          child: SettingItem(
                            icon: Icons.logout,
                            title: S.of(context).Logout,
                            iconColor: Colors.red,
                            borderColor: Colors.black26,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (BlocProvider.of<ProfileCubit>(context).user !=
                                null) {
                              navigate(
                                context: context,
                                screen: const EditProfileView(),
                              );
                            }
                          },
                          child: SettingItem(
                            icon: Icons.edit,
                            title: S.of(context).Edit,
                            borderColor: AppConstance.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingItem(
                          icon: Icons.shopping_cart_outlined,
                          title: S.of(context).Purchases,
                          borderColor: AppConstance.primaryColor,
                        ),
                        SettingItem(
                          icon: Icons.info_outline,
                          title: S.of(context).Info,
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
