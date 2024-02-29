import 'package:ecommerce/core/app_assets/app_assets.dart';
import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:ecommerce/core/app_styles/app_styles.dart';
import 'package:ecommerce/core/cache_helper/cache_helper.dart';
import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/core/functions/show_snack_bar.dart';
import 'package:ecommerce/core/service_locator/service_locator.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/custom_circular_progress_indicator.dart';
import 'package:ecommerce/core/widgets/custom_text_button.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce/features/auth/data/repos/auth_repo.dart';
import 'package:ecommerce/features/auth/presentation/view/register_view.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/favourites/presentation/manager/favourites_cubit/favourites_cubit.dart';
import 'package:ecommerce/features/layout/presentation/view/layout_view.dart';
import 'package:ecommerce/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../home/presentation/manager/home_cubit/home_cubit.dart';
import '../manager/login_cubit/login_cubit.dart';
import '../manager/login_cubit/login_states.dart';

class LoginView extends StatelessWidget {
  static var emailController = TextEditingController();
  static var passwordController = TextEditingController();
  static var formKey = GlobalKey<FormState>();

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => LoginCubit(
        serviceLocator<AuthRepo>(),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Hero(
                        tag: 'avatar',
                        child: Image.asset(
                          AppAssets.logo,
                          fit: BoxFit.cover,
                          height: screenSize.height * .2,
                          width: screenSize.width * .3,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        S.of(context).Welcome,
                        style: AppStyles.styles30Bold,
                      ),
                    ),
                    Center(
                      child: Text(
                        S.of(context).SignInToContinue,
                        style: AppStyles.style15Grey,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * .05,
                    ),
                    CustomTextFormField(
                      title: S.of(context).EnterYourEmail,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).PleaseEnterYourEmail;
                        }
                        return null;
                      },
                      pIcon: Icons.email_outlined,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      title: S.of(context).EnterYourPassword,
                      pIcon: Icons.password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).PleaseEnterYourPassword;
                        }
                        return null;
                      },
                      controller: passwordController,
                      isPassword: true,
                      isSuffixIconShown: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextButton(
                        title: S.of(context).ForgetPassword,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * .05,
                    ),
                    BlocConsumer<LoginCubit, LoginStates>(
                      listener: (context, state) async{
                        if (state is LoginErrorState) {
                          showSnackBar(
                            context: context,
                            label: state.error,
                            color: Colors.red,
                          );
                        }
                        if (state is LoginSuccessState) {
                          showSnackBar(
                            context: context,
                            label: 'Login Successfully',
                            color: AppConstance.primaryColor,
                          );
                          await CacheHelper.saveData(key: 'token', value: state.token);
                          ProfileCubit.get(context).getUserData();
                          HomeCubit.get(context).getAllProducts();
                          FavouritesCubit.get(context).getFavourites();
                          CartCubit.get(context).getCartProducts();

                          navigateAndRemoveUntil(context: context, screen: const LayoutView(),);
                          emptyFields();

                        }
                      },
                      builder: (context, state) {
                        var cubit = LoginCubit.get(context);
                        if (state is LoginLoadingState) {
                          return const CustomCircularProgressIndicator();
                        }

                        return CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          title: S.of(context).LOGIN,
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).DontHaveAnAccount),
                        CustomTextButton(
                          title: S.of(context).SignUp,
                          onPressed: () {
                            navigateWithoutAnimation(
                              context: context,
                              screen: const RegisterView(),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  emptyFields(){
    emailController.text = '' ;
    passwordController.text = '' ;
  }
}
