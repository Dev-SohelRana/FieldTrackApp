import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/constants/custom_app_list.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

int selectedIndex = 0;

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey200Color,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 48.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My tasks', style: TextFontStyle.headlinePoppins70021),
            UIHelper.verticalSpace(4.h),
            Text('Monday, Jun 15', style: TextFontStyle.headlinePoppins50013),
            UIHelper.verticalSpace(14.h),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
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
                            '1 of 5 done',
                            style: TextFontStyle.headlinePoppins70013,
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(6.h),
                      LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(12.r),
                        minHeight: 8.h,
                        value: 0.2,
                        color: AppColors.primaryColor,
                        backgroundColor: AppColors.grey200Color,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            UIHelper.verticalSpace(11.h),
            Row(
              children: List.generate(taskFilters.length, (index) {
                final bool isSelected = selectedIndex == index;

                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor
                            : AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.grey200Color,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      child: Text(
                        taskFilters[index],
                        style: TextFontStyle.headlinePoppins60013.copyWith(
                          color: isSelected
                              ? AppColors.cFFFFFF
                              : AppColors.titleColor,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            UIHelper.verticalSpace(11.h),
            ListView.builder(
              itemCount: 4,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // final task = tasks[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
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
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                            side: BorderSide(
                              color: AppColors.grey200Color,
                              width: 1.5.w,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Visit branch manager",
                                style: TextFontStyle.headlinePoppins60015,
                              ),
                              Text(
                                "Collect signed documents",
                                style: TextFontStyle.headlinePoppins40013,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 16.sp,
                                    color: AppColors.titleColor,
                                  ),
                                  UIHelper.horizontalSpace(5.w),
                                  Text(
                                    "Due 10:00 AM",
                                    style: TextFontStyle.headlinePoppins60012,
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
                                        "Pending",
                                        style:
                                            TextFontStyle.headlinePoppins70011,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
