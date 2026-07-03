import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/assets_helper/app_icons.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/features/task/presentation/task_screen.dart';
import 'package:field_track_app/helpers/helper_methods.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationScreen extends StatefulWidget {
  final int? pageNum;

  const NavigationScreen({super.key, this.pageNum});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const TaskScreen(),
    const TaskScreen(),
    const TaskScreen(),
    const TaskScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.pageNum ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        showMaterialDialog(context);
      },
      child: SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
          body: _screens[_currentIndex],
          extendBody: true,

          bottomNavigationBar: SizedBox(
            height: 120.h,
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Container(
                height: 80.h,
                width: double.infinity, // Full width
                // padding: EdgeInsets.symmetric(horizontal: 30.w),
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: _buildNavItem(
                        0,
                        _currentIndex == 0
                            ? AppIcons.taskSelectedIcon
                            : AppIcons.taskUnselectedIcon,
                        'Tasks',
                      ),
                    ),
                    Expanded(
                      child: _buildNavItem(
                        1,
                        _currentIndex == 1
                            ? AppIcons.locationSelectedIcon
                            : AppIcons.locationUnselectedIcon,
                        'Locations',
                      ),
                    ),
                    Expanded(
                      child: _buildNavItem(
                        2,
                        _currentIndex == 2
                            ? AppIcons.syncSelectedIcon
                            : AppIcons.syncUnselectedIcon,
                        'Sync',
                      ),
                    ),
                    Expanded(
                      child: _buildNavItem(
                        3,
                        _currentIndex == 3
                            ? AppIcons.profileSelectedIcon
                            : AppIcons.nameIcon,
                        'Profile',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String title) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                // color: isSelected ? AppColors.buttonbgColor : AppColors.cFFFFFF,
                width: 24.w,
                height: 24.h,
              ),
              UIHelper.verticalSpace(6.h),
              Text(
                title,
                style: TextFontStyle.headlinePoppins70014.copyWith(
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors
                            .textGrey100, // Change color based on selection
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
