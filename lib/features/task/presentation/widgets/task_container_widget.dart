import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskContainerWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool status;
  final Color statusColor;
  final Widget checkbox;
  const TaskContainerWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.checkbox,
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              checkbox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextFontStyle.headlinePoppins60015),
                    Text(subtitle, style: TextFontStyle.headlinePoppins40013),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16.sp,
                          color: AppColors.titleColor,
                        ),
                        UIHelper.horizontalSpace(5.w),
                        Text(time, style: TextFontStyle.headlinePoppins60012),
                        UIHelper.horizontalSpace(10.w),
                        Container(
                          decoration: BoxDecoration(
                            color: statusColor,
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 9.w,
                              vertical: 3.h,
                            ),
                            child: Text(
                              status ? 'Completed' : 'Pending',
                              style: TextFontStyle.headlinePoppins70011,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
