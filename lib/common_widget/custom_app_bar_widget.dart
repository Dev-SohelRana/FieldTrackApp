import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/assets_helper/app_icons.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final VoidCallback onTap;
  final Widget? actionWidget;
  const CustomAppBarWidget({
    super.key,
    this.title,
    required this.onTap,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: AppBar(
        leadingWidth: 55.w,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(6.sp),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.c000000,
                borderRadius: BorderRadius.circular(100.r),
              ),
              padding: EdgeInsets.all(12.sp),
              child: SvgPicture.asset(
                AppIcons.arrowBackIcon,
                color: AppColors.cFFFFFF,
              ),
            ),
          ),
        ),
        title: Text(title ?? '', style: TextFontStyle.headlinePoppins60020),
        actions: [
          if (actionWidget != null)
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.c000000,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                padding: EdgeInsets.all(10.sp),
                child: actionWidget,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
