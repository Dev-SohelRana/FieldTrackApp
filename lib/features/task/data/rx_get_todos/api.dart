import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:field_track_app/features/task/model/get_todos_response_model.dart';
import '../../../../../../../networks/dio/dio.dart';
import '../../../../../../../networks/endpoints.dart';
import '../../../../../../../networks/exception_handler/data_source.dart';

final class GetTodosApi {
  static final GetTodosApi _singleton = GetTodosApi._internal();
  GetTodosApi._internal();
  static GetTodosApi get instance => _singleton;

  Future<GetTodosResponseModel> getTodosApi() async {
    try {
      Response response = await getHttp(Endpoints.getTodos());

      if (response.statusCode == 200) {
        final data = GetTodosResponseModel.fromRawJson(
          json.encode(response.data),
        );
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
