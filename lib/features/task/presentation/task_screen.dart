import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/constants/custom_app_list.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/features/task/model/get_todos_response_model.dart';
import 'package:field_track_app/features/task/presentation/widgets/task_container_widget.dart';
import 'package:field_track_app/features/task/presentation/widgets/todays_progress_card_widget.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:field_track_app/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

int selectedIndex = 0;

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    super.initState();

    getTodosRXObj.getTodosRX();
  }

  List<Datum> tasks = [];
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey200Color,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 48.h),
          child: StreamBuilder(
            stream: getTodosRXObj.dataFetcher,
            builder: (context, snapshot) {
              final data = snapshot.data?.data;

              if (!isInitialized && data != null) {
                tasks = List<Datum>.from(data);
                isInitialized = true;
              }

              //for filtering tasks based on selected index
              List<Datum> filteredTasks;

              switch (selectedIndex) {
                case 1: // Pending
                  filteredTasks = tasks
                      .where((e) => !(e.isCompleted ?? false))
                      .toList();
                  break;

                case 2: // Completed
                  filteredTasks = tasks
                      .where((e) => e.isCompleted ?? false)
                      .toList();
                  break;

                default: // All
                  filteredTasks = tasks;
              }

              //forprogress bar
              final completedCount = tasks
                  .where((e) => e.isCompleted ?? false)
                  .length;

              final totalCount = tasks.length;

              final progress = totalCount == 0
                  ? 0.0
                  : completedCount / totalCount;
              if (snapshot.connectionState == ConnectionState.waiting &&
                  data == null) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: const Center(
                    child: SpinKitPulse(
                      color: AppColors.backgroundColor,
                      size: 70.0,
                    ),
                  ),
                );
              }
              if (snapshot.hasError) {
                return const Center(child: Text(""));
              }

              String formatDueTime(DateTime? dueAt) {
                if (dueAt == null) return '';

                return 'Due ${DateFormat('h.mm a').format(dueAt.toLocal())}';
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('My tasks', style: TextFontStyle.headlinePoppins70021),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    'Monday, Jun 15',
                    style: TextFontStyle.headlinePoppins50013,
                  ),
                  UIHelper.verticalSpace(14.h),
                  TodaysProgressCardWidget(
                    totalCompleted: '$completedCount of $totalCount done',
                    progressIndicator: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: AppColors.grey200Color,
                      color: AppColors.primaryColor,
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
                              style: TextFontStyle.headlinePoppins60013
                                  .copyWith(
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
                    itemCount: filteredTasks.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final task = filteredTasks[index];
                      return TaskContainerWidget(
                        title: task.title ?? '',
                        subtitle: task.description ?? '',
                        time: formatDueTime(task.dueAt),
                        status: task.isCompleted ?? false,
                        statusColor: (task.isCompleted ?? false)
                            ? AppColors.primaryColor
                            : AppColors.cE5B16F,
                        checkbox: Checkbox(
                          value: task.isCompleted ?? false,
                          activeColor: AppColors.primaryColor,
                          onChanged: (value) {
                            setState(() {
                              task.isCompleted = value ?? false;
                            });
                          },
                          side: BorderSide(
                            color: AppColors.grey200Color,
                            width: 1.5.w,
                          ),
                        ),
                      );
                    },
                  ),
                  UIHelper.verticalSpace(100.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
