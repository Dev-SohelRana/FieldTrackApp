import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/assets_helper/app_icons.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SyncScreen extends StatefulWidget {
  const SyncScreen({super.key});

  @override
  State<SyncScreen> createState() => _SyncScreenState();
}

class _SyncScreenState extends State<SyncScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 48.h),
        child: Column(
          children: [
            Text('Locations', style: TextFontStyle.headlinePoppins70021),
            UIHelper.verticalSpace(14.h),
            Container(
              width: double.infinity, // Full width
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.textGrey100, width: 2.w),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.syncSelectedIcon),
                    UIHelper.horizontalSpace(16.w),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'taskDoneToday',
                          style: TextFontStyle.headlinePoppins70018,
                        ),
                        UIHelper.verticalSpace(2.h),
                        Text(
                          'Tasks done today',
                          style: TextFontStyle.headlinePoppins40013,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            UIHelper.verticalSpace(12.h),
            Text(
              'Waiting to upload',
              style: TextFontStyle.headlinePoppins60015,
            ),
            UIHelper.verticalSpace(12.h),
            Container(
              width: double.infinity, // Full width
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.textGrey100, width: 2.w),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.pendingTaskIcon),
                    UIHelper.horizontalSpace(16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'taskDoneToday',
                          style: TextFontStyle.headlinePoppins70018,
                        ),
                        UIHelper.verticalSpace(2.h),
                        Text(
                          'Tasks done today',
                          style: TextFontStyle.headlinePoppins40013,
                        ),
                      ],
                    ),
                    UIHelper.horizontalSpace(10.w),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.cE5B16F,
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.w,
                          vertical: 3.h,
                        ),
                        child: Text(
                          'Pending',
                          style: TextFontStyle.headlinePoppins70011,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
