import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/assets_helper/app_icons.dart';
import 'package:field_track_app/constants/app_constants.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/features/profile/presentation/widgets/logout_dialog_widget.dart';
import 'package:field_track_app/features/profile/presentation/widgets/profile_details_widget.dart';
import 'package:field_track_app/features/profile/presentation/widgets/settings_container_widget.dart';
import 'package:field_track_app/features/profile/presentation/widgets/task_location_row_widget.dart';
import 'package:field_track_app/helpers/all_routes.dart';
import 'package:field_track_app/helpers/di.dart';
import 'package:field_track_app/helpers/navigation_service.dart';
import 'package:field_track_app/helpers/toast.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:field_track_app/networks/api_acess.dart';
import 'package:field_track_app/networks/dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    profileInfoRXObj.profileInfoRX();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey200Color,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 48.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Profile', style: TextFontStyle.headlinePoppins70021),
              UIHelper.verticalSpace(4.h),
              StreamBuilder(
                stream: profileInfoRXObj.dataFetcher,
                builder: (context, snapshot) {
                  final data = snapshot.data;

                  if (snapshot.connectionState == ConnectionState.waiting &&
                      data == null) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: const Center(
                        child: SpinKitPulse(
                          color: AppColors.backgroundColor,
                          size: 70.0,
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text(""));
                  }

                  return ProfileDetailsWidget(
                    profileImageUrl: 'https://example.com/profile.jpg',
                    title: data?.name ?? '',
                    subtitle: data?.email ?? '',
                    badgeText: 'Field User',
                  );
                },
              ),
              UIHelper.verticalSpace(16.h),
              TaskLocationRowWidget(taskDoneToday: '1/5', activeLocations: '5'),
              UIHelper.verticalSpace(16.h),
              SettingsContainerWidget(
                editProfileOntap: () {
                  // Handle edit profile tap
                },
                notificationOntap: () {
                  // Handle notifications tap
                },
                settingsOntap: () {
                  // Handle settings tap
                },
                helpOntap: () {
                  // Handle help & support tap
                },
              ),
              UIHelper.verticalSpace(16.h),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return LogoutDialogWidget(
                        onYesTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(
                              child: SpinKitCircle(
                                color: AppColors.primaryColor,
                                size: 60.0,
                              ),
                            ),
                          );

                          // //Delete token for push notification.
                          // await FirebaseMessaging.instance.deleteToken();
                          // await FirebaseAuth.instance.signOut();

                          final value = await logOutRXObj.logOutRx();
                          setState(() {
                            isLoading = false;
                            appData.write(kKeyIsLoggedIn, false);
                            appData.write(kKeyAccessToken, null);
                            appData.write(kKeyFCMToken, null);
                          });

                          if (value) {
                            await appData.write(kKeyIsLoggedIn, false);
                            await appData.write(kKeyAccessToken, null);
                            await appData.write(kKeyFCMToken, null);

                            ToastUtil.showShortToast("Logout successfully.");
                            // ToastUtil.showShortToast(
                            //     kKeyFCMToken);
                            DioSingleton.instance.update("");
                            NavigationService.navigateToReplacementUntil(
                              Routes.loginScreen,
                            );
                          } else {
                            ToastUtil.showShortToast("Failed to logout.");
                          }
                        },
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: AppColors.deleteBgColor,
                      width: 2.w,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.logoutIcon),
                        UIHelper.horizontalSpace(8.w),
                        Text(
                          'Sign out',
                          style: TextFontStyle.headlinePoppins60016.copyWith(
                            color: AppColors.deleteBgColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              UIHelper.verticalSpace(160.h),
            ],
          ),
        ),
      ),
    );
  }
}
