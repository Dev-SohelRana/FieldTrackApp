// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:field_track_app/features/locations/model/get_location_response_model.dart';
import 'package:field_track_app/helpers/toast.dart';
import 'package:field_track_app/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

import 'api.dart';

final class GetLocationsRX extends RxResponseInt<GetLocationsResponseModel> {
  final api = GetLocationsApi.instance;

  GetLocationsRX({required super.empty, required super.dataFetcher});

  ValueStream get articleSteam => dataFetcher.stream;

  Future<void> getLocationsRX() async {
    try {
      GetLocationsResponseModel data = await api.getLocationsApi();
      handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response?.statusCode == 422) {
        ToastUtil.showShortToast(error.response!.data["message"]);
      } else {
        ToastUtil.showShortToast(error.response?.data["error"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }
}
