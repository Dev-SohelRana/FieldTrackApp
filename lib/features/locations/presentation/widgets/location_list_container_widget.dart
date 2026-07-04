import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/assets_helper/app_icons.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LocationListContainerWidget extends StatelessWidget {
  final String title;
  final String coordinates;
  final int radius;
  final String status;
  const LocationListContainerWidget({
    super.key,
    required this.title,
    required this.coordinates,
    required this.radius,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
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
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.locationPinIcon),
                        UIHelper.horizontalSpace(16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextFontStyle.headlinePoppins60015,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppIcons.latlgnIcon),
                                  UIHelper.horizontalSpace(4.w),
                                  Text(
                                    coordinates,
                                    style: TextFontStyle.headlinePoppins40013,
                                  ),
                                ],
                              ),
                              UIHelper.verticalSpace(12.h),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.textGrey100,
                                      borderRadius: BorderRadius.circular(7.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 9.w,
                                        vertical: 3.h,
                                      ),
                                      child: Text(
                                        radius.toString(),
                                        style:
                                            TextFontStyle.headlinePoppins70011,
                                      ),
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(10.w),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor.withAlpha(
                                        30,
                                      ),
                                      borderRadius: BorderRadius.circular(7.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 9.w,
                                        vertical: 3.h,
                                      ),
                                      child: Text(
                                        status,
                                        style:
                                            TextFontStyle.headlinePoppins70011,
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
                  Icon(Icons.arrow_forward_ios, size: 16.sp),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
