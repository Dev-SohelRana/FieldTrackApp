import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:field_track_app/features/auth/model/login_response_model.dart';
import 'package:field_track_app/networks/dio/dio.dart';
import 'package:field_track_app/networks/endpoints.dart';
import 'package:field_track_app/networks/exception_handler/data_source.dart';

final class LogInApi {
  static final LogInApi _singleton = LogInApi._internal();
  LogInApi._internal();
  static LogInApi get instance => _singleton;

  Future<LoginResponseModel> logInApi({
    required String email,
    required String password,
  }) async {
    try {
      Map data = {"email": email, "password": password};

      Response response = await postHttp(Endpoints.logIn(), data);

      if (response.statusCode == 200) {
        final data = LoginResponseModel.fromRawJson(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
