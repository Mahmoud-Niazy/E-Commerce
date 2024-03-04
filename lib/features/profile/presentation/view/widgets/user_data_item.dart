import 'package:ecommerce/core/cache_helper/cache_helper.dart';
import 'package:ecommerce/core/widgets/custom_circular_progress_indicator.dart';
import 'package:ecommerce/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_assets/app_assets.dart';
import '../../../../../core/app_constance/app_constance.dart';
import '../../../../../core/app_styles/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/profile_cubit/profile_states.dart';
import 'lang_toggle_widget.dart';

class UserDataItem extends StatelessWidget {
  const UserDataItem({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: screenSize.height * .3,
          decoration: BoxDecoration(
            color: AppConstance.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(screenSize.width * .25),
              bottomRight: Radius.circular(screenSize.width * .25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * .04,
                    ),
                    Text(
                      S.of(context).Settings,
                      style: AppStyles.styles30Bold.copyWith(
                        color: Colors.white,
                        fontSize: 27
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      S.of(context).Arabic,
                      style: AppStyles.style18.copyWith(color: Colors.white),
                    ),
                    const LangToggleWidget(),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: screenSize.height * .03),
            width: screenSize.width * .9,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: BlocBuilder<ProfileCubit, ProfileStates>(
              builder: (context, state) {
                var cubit = ProfileCubit.get(context);
                if (state is GetUserDataLoadingState) {
                  return SizedBox(
                    height: screenSize.height * .15,
                    child: const CustomCircularProgressIndicator(),
                  );
                }
                if (state is GetUserDataErrorState) {
                  return Center(
                    child: Text(
                      state.error,
                    ),
                  );
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: 'avatar',
                      child: Container(
                        height: screenSize.height * .15,
                        width: screenSize.width * .25,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              AppAssets.avatar,
                            ),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      cubit.user!.name,
                      style: AppStyles.style20Bold,
                    ),
                    Text(
                      cubit.user!.email,
                      style: AppStyles.style18Grey,
                    ),
                    Text(
                      cubit.user!.phone,
                      style: AppStyles.style15Grey,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
