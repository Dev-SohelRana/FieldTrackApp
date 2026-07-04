import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodaysProgressCardWidget extends StatelessWidget {
  final String totalCompleted;
  final Widget progressIndicator;
  const TodaysProgressCardWidget({
    super.key,
    required this.totalCompleted,
    required this.progressIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Color(0x0C141C28),
              blurRadius: 16,
              offset: Offset(0, 6),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x0F141C28),
              blurRadius: 2,
              offset: Offset(0, 1),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's progress",
                    style: TextFontStyle.headlinePoppins70021,
                  ),
                  Text(
                    totalCompleted,
                    style: TextFontStyle.headlinePoppins70013,
                  ),
                ],
              ),
              UIHelper.verticalSpace(6.h),
              progressIndicator,
            ],
          ),
        ),
      ),
    );
  }
}
