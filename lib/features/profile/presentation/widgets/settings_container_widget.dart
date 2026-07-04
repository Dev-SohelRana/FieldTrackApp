import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/assets_helper/app_icons.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingsContainerWidget extends StatelessWidget {
  final VoidCallback editProfileOntap;
  final VoidCallback notificationOntap;
  final VoidCallback settingsOntap;
  final VoidCallback helpOntap;
  const SettingsContainerWidget({
    super.key,
    required this.editProfileOntap,
    required this.notificationOntap,
    required this.settingsOntap,
    required this.helpOntap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.textGrey100, width: 2.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              editProfileOntap();
            },
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withAlpha(30),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: SvgPicture.asset(AppIcons.nameIcon),
                        ),
                      ),
                      UIHelper.horizontalSpace(8.w),
                      Text(
                        'Edit profile',
                        style: TextFontStyle.headlinePoppins50014,
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16.sp),
                ],
              ),
            ),
          ),
          UIHelper.verticalSpace(6.h),
          UIHelper.customDivider(color: AppColors.textGrey100),
          UIHelper.verticalSpace(6.h),
          GestureDetector(
            onTap: () {
              notificationOntap();
            },
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withAlpha(30),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: SvgPicture.asset(AppIcons.notificationIcon),
                        ),
                      ),
                      UIHelper.horizontalSpace(8.w),
                      Text(
                        'Notifications',
                        style: TextFontStyle.headlinePoppins50014,
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16.sp),
                ],
              ),
            ),
          ),
          UIHelper.verticalSpace(6.h),
          UIHelper.customDivider(color: AppColors.textGrey100),
          UIHelper.verticalSpace(6.h),
          GestureDetector(
            onTap: () {
              settingsOntap();
            },
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withAlpha(30),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: SvgPicture.asset(AppIcons.settingsIcon),
                        ),
                      ),
                      UIHelper.horizontalSpace(8.w),
                      Text(
                        'Settings',
                        style: TextFontStyle.headlinePoppins50014,
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16.sp),
                ],
              ),
            ),
          ),
          UIHelper.verticalSpace(6.h),
          UIHelper.customDivider(color: AppColors.textGrey100),
          UIHelper.verticalSpace(6.h),
          GestureDetector(
            onTap: () {
              helpOntap();
            },
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withAlpha(30),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: SvgPicture.asset(AppIcons.helpIcon),
                        ),
                      ),
                      UIHelper.horizontalSpace(8.w),
                      Text(
                        'Help & support',
                        style: TextFontStyle.headlinePoppins50014,
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16.sp),
                ],
              ),
            ),
          ),
          UIHelper.verticalSpace(6.h),
        ],
      ),
    );
  }
}
