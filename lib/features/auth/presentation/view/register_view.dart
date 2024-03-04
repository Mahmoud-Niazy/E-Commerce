import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/core/service_locator/service_locator.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/custom_circular_progress_indicator.dart';
import 'package:ecommerce/features/auth/data/models/user_registration_input_model.dart';
import 'package:ecommerce/features/auth/data/repos/auth_repo.dart';
import 'package:ecommerce/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:ecommerce/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_assets/app_assets.dart';
import '../../../../core/app_constance/app_constance.dart';
import '../../../../core/app_styles/app_styles.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../manager/register_cubit/register_states.dart';

class RegisterView extends StatelessWidget {
  static var emailController = TextEditingController();
  static var passwordController = TextEditingController();
  static var nameController = TextEditingController();
  static var phoneController = TextEditingController();
  static var formKey = GlobalKey<FormState>();

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RegisterCubit(serviceLocator<AuthRepo>()),
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
                    const Center(
                      child: Text(
                        'Create Account',
                        style: AppStyles.styles30Bold,
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Create a new account',
                        style: AppStyles.style15Grey,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * .05,
                    ),
                    CustomTextFormField(
                      title: S.of(context).EnterYourName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).PleaseEnterYourName;
                        }
                        return null;
                      },
                      pIcon: Icons.person,
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 15,
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
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      title: S.of(context).EnterYourPhone,
                      pIcon: Icons.phone_android,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).PleaseEnterYourPhone;
                        }
                        return null;
                      },
                      controller: phoneController,
                    ),
                    SizedBox(
                      height: screenSize.height * .1,
                    ),
                    BlocConsumer<RegisterCubit, RegisterStates>(
                      listener: (context, state) {
                        if (state is RegisterErrorState) {
                          showSnackBar(
                            context: context,
                            label: state.error,
                            color: Colors.red,
                          );
                        }
                        if (state is RegisterSuccessState) {
                          showSnackBar(
                            context: context,
                            label: 'Register Successfully',
                            color: AppConstance.primaryColor,
                          );
                          navigateAndRemoveUntil(
                            context: context,
                            screen: const LoginView(),
                          );
                          emptyTextFields();
                        }
                      },
                      builder: (context, state) {
                        var cubit = RegisterCubit.get(context);
                        if (state is RegisterLoadingState) {
                          return const CustomCircularProgressIndicator();
                        }
                        return CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              UserRegistrationInputModel userData =
                                  UserRegistrationInputModel(
                                phone: phoneController.text,
                                password: passwordController.text,
                                email: emailController.text,
                                name: nameController.text,
                              );
                              cubit.register(userData: userData);
                            }
                          },
                          title: 'Register',
                        );
                      },
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
  emptyTextFields(){
    nameController.text = '' ;
    emailController.text = '' ;
    passwordController.text = '' ;
    phoneController.text = '' ;

  }
}
