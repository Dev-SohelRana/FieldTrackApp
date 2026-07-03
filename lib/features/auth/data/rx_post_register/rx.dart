import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:field_track_app/helpers/toast.dart';
import 'package:field_track_app/networks/rx_base.dart';

import 'package:rxdart/rxdart.dart';
import 'api.dart';

final class RegisterRx extends RxResponseInt<Map> {
  final api = RegisterApi.instance;

  RegisterRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> registerRx({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      Map data = await api.registerApi(
        email: email,
        password: password,
        fullName: fullName,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      handleErrorWithReturn(error);
      return false;
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response?.statusCode == 409 ||
          error.response?.statusCode == 422) {
        ToastUtil.showShortToast(
          error.response?.data["error"]?["message"] ?? "Something went wrong",
        );
      } else {
        ToastUtil.showShortToast(
          error.response?.data["error"]?["message"] ??
              error.message ??
              "Something went wrong",
        );
      }
    }

    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}
