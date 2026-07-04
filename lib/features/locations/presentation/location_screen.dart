import 'package:field_track_app/assets_helper/app_colors.dart';
import 'package:field_track_app/common_widget/custom_text_form_field.dart';
import 'package:field_track_app/constants/text_font_style.dart';
import 'package:field_track_app/features/locations/presentation/widgets/location_list_container_widget.dart';
import 'package:field_track_app/helpers/ui_helpers.dart';
import 'package:field_track_app/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();

    getLocationsRXObj.getLocationsRX();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 48.h),
          child: StreamBuilder(
            stream: getLocationsRXObj.dataFetcher,
            builder: (context, snapshot) {
              final data = snapshot.data?.data;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Locations', style: TextFontStyle.headlinePoppins70021),
                  UIHelper.verticalSpace(14.h),
                  CustomTextFormField(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                  UIHelper.verticalSpace(12.h),
                  ListView.builder(
                    itemCount: data?.length ?? 0,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 20.h),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final location = data?[index];
                      return LocationListContainerWidget(
                        title: location?.locationName ?? '',
                        coordinates:
                            '${location?.latitude?.toStringAsFixed(6) ?? '0.000000'}, ${location?.longitude?.toStringAsFixed(6) ?? '0.000000'}',
                        radius: location?.radiusM ?? 0,
                        status: location?.isActive ?? false
                            ? 'Available'
                            : 'Not Available',
                      );
                    },
                  ),
                  UIHelper.verticalSpace(140.h),
                ],
              );
            },
          ),
        ),
      ),

      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 100.h),
        child: FloatingActionButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          backgroundColor: AppColors.primaryColor,
          elevation: 4,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
