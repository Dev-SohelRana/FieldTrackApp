import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:field_track_app/networks/dio/dio.dart';
import 'package:field_track_app/networks/endpoints.dart';
import 'package:field_track_app/networks/exception_handler/data_source.dart';

final class RegisterApi {
  static final RegisterApi _singleton = RegisterApi._internal();
  RegisterApi._internal();
  static RegisterApi get instance => _singleton;

  Future<Map> registerApi({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      var data = ({
        "email": email,
        "password": password,
        "full_name": fullName,
      });

      Response response = await postHttp(Endpoints.register(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
