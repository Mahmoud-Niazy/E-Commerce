import 'package:ecommerce/core/app_assets/app_assets.dart';
import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:ecommerce/core/functions/show_snack_bar.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/custom_circular_progress_indicator.dart';
import 'package:ecommerce/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:ecommerce/features/profile/presentation/view/widgets/custom_text_field_with_underline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_styles/app_styles.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/widgets/circular_button.dart';
import '../../../../generated/l10n.dart';
import '../manager/profile_cubit/profile_states.dart';

class EditProfileView extends StatefulWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

   const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
   TextEditingController nameController = TextEditingController();

   TextEditingController emailController = TextEditingController();

   TextEditingController phoneController = TextEditingController();

   TextEditingController passwordController = TextEditingController();

   @override
  void initState() {
    super.initState();
    nameController.text = ProfileCubit.get(context).user!.name;
    emailController.text = ProfileCubit.get(context).user!.email;
    phoneController.text = ProfileCubit.get(context).user!.phone;
    phoneController.text = ProfileCubit.get(context).user!.phone;
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: EditProfileView.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircularButton(
                            icon: Icons.arrow_back_ios_new,
                            onPressed: () {
                              navigatePop(context: context);
                            },
                          ),
                           Text(
                            S.of(context).EditProfile,
                            style: AppStyles.style20Bold,
                          ),
                          CircularButton(
                            icon: Icons.more_horiz,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenSize.height * .18,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Hero(
                              tag: 'avatar',
                              child: Image.asset(
                                AppAssets.avatar,
                                height: screenSize.height * .2,
                                width: screenSize.width * .3,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: AppConstance.primaryColor,
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * .05,
                      ),
                      CustomTextFieldWithUnderLine(
                        label: S.of(context).Name,
                        controller: nameController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).PleaseEnterYourName;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: screenSize.height * .04,
                      ),
                      CustomTextFieldWithUnderLine(
                        label: S.of(context).Email,
                        controller: emailController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).PleaseEnterYourEmail;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: screenSize.height * .04,
                      ),
                      CustomTextFieldWithUnderLine(
                        isSuffixIconShown: true,
                        label: S.of(context).Password,
                        isPassword: true,
                        controller: passwordController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).PleaseEnterYourPassword;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: screenSize.height * .04,
                      ),
                      CustomTextFieldWithUnderLine(
                        label: S.of(context).Phone,
                        controller: phoneController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).PleaseEnterYourPhone;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: screenSize.height * .04,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * .1,
                  ),
                  BlocConsumer<ProfileCubit, ProfileStates>(
                    listener: (context, state) {
                      if (state is UpdateUserDataErrorState) {
                        showSnackBar(
                          context: context,
                          label: state.error,
                          color: Colors.red,
                        );
                      }
                      if (state is UpdateUserDataSuccessfullyState) {
                        navigatePop(context: context);
                        ProfileCubit.get(context).getUserData();
                        showSnackBar(
                          context: context,
                          label: S.of(context).Successfully,
                          color: AppConstance.primaryColor,
                        );
                      }
                    },
                    builder: (context, state) {
                      var cubit = ProfileCubit.get(context);

                      if (state is UpdateUserDataLoadingState) {
                        return const CustomCircularProgressIndicator();
                      }
                      return CustomButton(
                        onPressed: () {
                          if (EditProfileView.formKey.currentState!.validate()) {
                            cubit.updateUserData(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                              image: ProfileCubit.get(context).user!.image,
                            );
                          }
                        },
                        title: S.of(context).Update,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
