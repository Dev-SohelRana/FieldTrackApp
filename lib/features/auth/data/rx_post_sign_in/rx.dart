// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:field_track_app/constants/app_constants.dart';
import 'package:field_track_app/features/auth/data/rx_post_sign_in/api.dart';
import 'package:field_track_app/features/auth/model/login_response_model.dart';
import 'package:field_track_app/helpers/di.dart';
import 'package:field_track_app/networks/dio/dio.dart';
import 'package:field_track_app/networks/rx_base.dart';

import 'package:rxdart/rxdart.dart';

import '../../../../../../../helpers/toast.dart';

final class LoginRX extends RxResponseInt<LoginResponseModel> {
  final api = LogInApi.instance;

  LoginRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> logInRX({
    required String email,
    required String password,
  }) async {
    try {
      LoginResponseModel data = await api.logInApi(
        email: email,
        password: password,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(LoginResponseModel data) {
    appData.write(kKeyAccessToken, data.accessToken);
    // appData.write(kKeyUserID, data.data?.id);
    appData.write(kKeyIsLoggedIn, true);
    String token = appData.read(kKeyAccessToken);
    DioSingleton.instance.update(token);
    dataFetcher.sink.add(data);
    return data;
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 422) {
        ToastUtil.showShortToast(error.response!.data["message"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }
}
