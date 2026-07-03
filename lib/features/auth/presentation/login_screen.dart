import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/assets_helper/app_icons.dart';
import 'package:field_track_app/assets_helper/app_image.dart';
import 'package:field_track_app/common_widget/custom_button.dart';
import 'package:field_track_app/common_widget/custom_text_form_field.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/helpers/all_routes.dart';
import 'package:field_track_app/helpers/navigation_service.dart';
import 'package:field_track_app/helpers/toast.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:field_track_app/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;
  bool isChecked = false;

  bool isLoading = false;

  Future<void> loginMethod() async {
    if (!formKey.currentState!.validate()) return;

    try {
      setState(() {
        isLoading = true;
      });

      final isSuccess = await loginRXObj.logInRX(
        email: emailController.text,
        password: passwordController.text,
      );

      if (isSuccess) {
        ToastUtil.showShortToast('Success Log In');
        NavigationService.navigateTo(Routes.navigationScreen);
      } else {
        ToastUtil.showShortToast('Log In Failed');
      }
    } catch (e) {
      // ToastUtil.showShortToast('Error: ${e.toString()}');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(28.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UIHelper.verticalSpace(100.h),
                  Center(child: Image.asset(AppImages.splashImage)),
                  UIHelper.verticalSpace(12.h),
                  Center(
                    child: Text(
                      'Welcome Back',
                      style: TextFontStyle.headlinePoppins50024.copyWith(
                        color: AppColors.c000000,
                      ),
                    ),
                  ),
                  UIHelper.verticalSpace(4.h),
                  Center(
                    child: Text(
                      'Sign in to start your shift',
                      style: TextFontStyle.headlinePoppins40016grey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  UIHelper.verticalSpace(32.h),
                  Text(
                    'Email',
                    style: TextFontStyle.headlinePoppins60012,
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpace(7.h),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: 'john.doe@example.com',
                    prefixIcon: SvgPicture.asset(AppIcons.emailIcon),
                    textInputAction: TextInputAction.next,
                    validator: (v) {
                      final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                      if (v == null || v.trim().isEmpty) {
                        return 'Email is required';
                      }
                      if (!emailRegex.hasMatch(v.trim())) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text(
                    'Password',
                    style: TextFontStyle.headlinePoppins60012,
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpace(7.h),
                  CustomTextFormField(
                    controller: passwordController,
                    prefixIcon: SvgPicture.asset(AppIcons.passwordIcon),
                    hintText: 'Password',
                    textInputAction: TextInputAction.done,
                    obscureText: obscureTextPassword,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureTextPassword = !obscureTextPassword;
                        });
                      },
                      child: Icon(
                        obscureTextPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Password is required';
                      }
                      if (v.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  UIHelper.verticalSpace(14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // NavigationService.navigateTo(
                          //   Routes.forgotPasswordScreen,
                          // );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextFontStyle.headlinePoppins40016grey
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(22.h),
                  isLoading
                      ? Center(
                          child: SpinKitCircle(
                            color: AppColors.primaryColor,
                            size: 60.h,
                          ),
                        )
                      : CustomButton(
                          onTap: () {
                            loginMethod();
                          },
                          title: 'Sign in',
                        ),
                  UIHelper.verticalSpace(22.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextFontStyle.headlinePoppins40014grey,
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(Routes.signUpScreen);
                        },
                        child: Text(
                          'Register',
                          style: TextFontStyle.headlinePoppins40014grey
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ),
                    ],
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
