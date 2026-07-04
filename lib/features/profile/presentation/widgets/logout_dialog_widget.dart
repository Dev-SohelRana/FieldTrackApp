import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/common_widget/custom_button.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/helpers/navigation_service.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutDialogWidget extends StatelessWidget {
  final VoidCallback onYesTap;
  const LogoutDialogWidget({super.key, required this.onYesTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.cFFFFFF,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Do you want to log out?',
              style: TextFontStyle.headlinePoppins50024.copyWith(
                color: AppColors.deleteBgColor.withAlpha(200),
              ),
              textAlign: TextAlign.center,
            ),
            UIHelper.verticalSpace(32.h),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      NavigationService.goBack;
                    },
                    title: 'No',
                    fillColor: Colors.transparent,
                    textColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                  ),
                ),
                UIHelper.horizontalSpace(12.w),
                Expanded(
                  child: CustomButton(
                    onTap: onYesTap,
                    title: 'Yes',
                    fillColor: AppColors.deleteBgColor,
                    textColor: AppColors.cFFFFFF,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
