import 'package:cached_network_image/cached_network_image.dart';
import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/assets_helper/app_icons.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileDetailsWidget extends StatelessWidget {
  final String profileImageUrl;
  final String title;
  final String subtitle;
  final String badgeText;
  const ProfileDetailsWidget({
    super.key,
    required this.profileImageUrl,
    required this.title,
    required this.subtitle,
    required this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.textGrey100, width: 2.w),

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
            ClipRRect(
              borderRadius: BorderRadius.circular(150.r),
              child: CachedNetworkImage(
                errorWidget: (context, url, error) {
                  return Container(
                    width: 76.w,
                    height: 76.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withAlpha(30),
                      borderRadius: BorderRadius.circular(150.r),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(150.r),
                    child: Container(
                      width: 76.w,
                      height: 76.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withAlpha(30),
                        borderRadius: BorderRadius.circular(150.r),
                      ),
                    ),
                  );
                },
                imageUrl: profileImageUrl,
                width: 76.w,
                height: 76.h,
                fit: BoxFit.cover,
              ),
            ),
            UIHelper.verticalSpace(12.h),
            Text(title, style: TextFontStyle.headlinePoppins70018),
            UIHelper.verticalSpace(4.h),
            Text(subtitle, style: TextFontStyle.headlinePoppins40013),
            UIHelper.verticalSpace(12.h),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withAlpha(30),
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 5.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.fieldUserBadge),
                    UIHelper.horizontalSpace(8.w),
                    Text(badgeText, style: TextFontStyle.headlinePoppins60013),
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
