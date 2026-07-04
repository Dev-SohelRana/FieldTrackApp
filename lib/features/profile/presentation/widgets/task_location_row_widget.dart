import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskLocationRowWidget extends StatelessWidget {
  final String taskDoneToday;
  final String activeLocations;
  const TaskLocationRowWidget({
    super.key,
    required this.taskDoneToday,
    required this.activeLocations,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: double.infinity, // Full width
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.textGrey100, width: 2.w),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      taskDoneToday,
                      style: TextFontStyle.headlinePoppins70018,
                    ),
                    UIHelper.verticalSpace(2.h),
                    Text(
                      'Tasks done today',
                      style: TextFontStyle.headlinePoppins40013,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        UIHelper.horizontalSpace(12.w),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: double.infinity, // Full width
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.textGrey100, width: 2.w),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      activeLocations,
                      style: TextFontStyle.headlinePoppins70018,
                    ),
                    UIHelper.verticalSpace(2.h),
                    Text(
                      'Active locations',
                      style: TextFontStyle.headlinePoppins40013,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
