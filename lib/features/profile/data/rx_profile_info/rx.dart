// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:field_track_app/features/profile/model/profile_info_response_model.dart';
import 'package:field_track_app/helpers/di.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../../helpers/toast.dart';
import '../../../../../../../networks/rx_base.dart';
import '../../../../../../../helpers/navigation_service.dart';
import '../../../../../../../helpers/all_routes.dart';
import 'api.dart';

final class ProfileInfoRX extends RxResponseInt<ProfileInfoResponseModel> {
  final api = ProfileInfoApi.instance;

  ProfileInfoRX({required super.empty, required super.dataFetcher});

  ValueStream get articleSteam => dataFetcher.stream;

  Future<void> profileInfoRX() async {
    try {
      ProfileInfoResponseModel data = await api.profileInfoApi();

      handleSuccessWithReturn(data);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      final statusCode = error.response?.statusCode;

      log("API Error Status Code: $statusCode");

      /// 🔴 Unauthorized
      if (statusCode == 401) {
        log("User Unauthenticated → Redirecting to Login");

        /// Delete token + clear storage
        appData.erase();

        /// Navigate to login and remove all routes
        NavigationService.navigateToReplacementUntil(Routes.loginScreen);

        return;
      }

      /// Validation error
      if (statusCode == 422) {
        ToastUtil.showShortToast(
          error.response?.data["message"] ?? "Validation error",
        );
      }
    }

    log(error.toString());

    dataFetcher.sink.addError(error);

    return false;
  }
}
