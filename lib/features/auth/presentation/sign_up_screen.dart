import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/assets_helper/app_icons.dart';
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
import 'package:flutter_svg/svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;
  bool isChecked = false;
  bool isType = false;

  bool isLoading = false;

  Future<bool> registerMethod() async {
    try {
      if (formKey.currentState!.validate()) {
        setState(() {
          isLoading = true;
        });
        await registerRxOBJ
            .registerRx(
              email: emailController.text,
              password: passwordController.text,
              fullName: fullNameController.text,
            )
            .then((value) {
              if (value) {
                setState(() {
                  isLoading = false;
                });
                ToastUtil.showLongToast(
                  'Registration successful. Please log in.',
                );
                NavigationService.navigateTo(Routes.loginScreen);
              } else {
                setState(() {
                  isLoading = false;
                });
                ToastUtil.showLongToast('Registration failed');
              }
            });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ToastUtil.showShortToast(e.toString());
      // ToastUtil.showShortToast(
      //     "Something went wrong. Please recheck all fields and try again.");
    }
    return true;
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
                  Center(child: SvgPicture.asset(AppIcons.logo)),
                  UIHelper.verticalSpace(12.h),
                  Center(
                    child: Text(
                      'Create your account',
                      style: TextFontStyle.headlinePoppins70024,
                    ),
                  ),
                  UIHelper.verticalSpace(6.h),
                  Center(
                    child: Text(
                      'Join your team on FieldTrack',
                      style: TextFontStyle.headlinePoppins40016grey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  UIHelper.verticalSpace(26.h),
                  Text(
                    'Full Name',
                    style: TextFontStyle.headlinePoppins60012,
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpace(7.h),
                  CustomTextFormField(
                    controller: fullNameController,
                    prefixIcon: SvgPicture.asset(AppIcons.passwordIcon),
                    hintText: 'John Doe',
                    textInputAction: TextInputAction.next,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Full name is required';
                      }

                      return null;
                    },
                  ),
                  UIHelper.verticalSpace(14.h),
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
                  UIHelper.verticalSpace(14.h),
                  Text(
                    'Password',
                    style: TextFontStyle.headlinePoppins60012,
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpace(7.h),

                  CustomTextFormField(
                    controller: passwordController,
                    prefixIcon: SvgPicture.asset(AppIcons.passwordIcon),
                    hintText: 'Create a password',
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
                        // color: AppColors.grey200Color,
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

                  UIHelper.verticalSpace(24.h),
                  isLoading
                      ? Center(
                          child: SpinKitCircle(
                            color: AppColors.primaryColor,
                            size: 60.h,
                          ),
                        )
                      : CustomButton(
                          onTap: () {
                            registerMethod();
                          },
                          title: 'Create account',
                        ),
                  UIHelper.verticalSpace(22.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextFontStyle.headlinePoppins40014grey,
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(Routes.loginScreen);
                        },
                        child: Text(
                          'Sign in',
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
 























// Center(
              //   child: Lottie.asset(
              //     AppLotties.sampleLottie,
              //     width: 250,
              //     height: 250,
              //   ),
              // ),
              // Center(
              //   child: Lottie.asset(
              //     'assets/lottie/rh_match_lottie_v480_test01.json',
              //     width: 150,
              //     height: 150,
              //     repeat: true,
              //     animate: true,
              //     delegates: LottieDelegates(
              //       values: [
              //         ValueDelegate.color(['Ring Layer', 'DashedRing-stroke'],
              //             value: Colors.blue),
              //       ],
              //     ),
              //   ),
              // ),
              // UIHelper.verticalSpace(10.h),
              // Center(
              //     child: Lottie.asset(AppLotties.testingLottie,
              //         width: 250,
              //         height: 250,
              //         repeat: true,
              //         animate: true,
              //         fit: BoxFit.fill,
              //         frameRate: FrameRate.composition)),
              // UIHelper.verticalSpace(10.h),
              // Center(
              //   child: Lottie.asset(
              //     AppLotties.testingLottie,
              //     width: 250,
              //     height: 250,
              //     repeat: true,
              //     animate: true,
              //   ),
              // ),