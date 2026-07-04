import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:field_track_app/features/locations/model/get_location_response_model.dart';
import 'package:field_track_app/networks/dio/dio.dart';
import 'package:field_track_app/networks/endpoints.dart';
import 'package:field_track_app/networks/exception_handler/data_source.dart';

final class GetLocationsApi {
  static final GetLocationsApi _singleton = GetLocationsApi._internal();
  GetLocationsApi._internal();
  static GetLocationsApi get instance => _singleton;

  Future<GetLocationsResponseModel> getLocationsApi() async {
    try {
      Response response = await getHttp(Endpoints.getLocations());

      if (response.statusCode == 200) {
        final data = GetLocationsResponseModel.fromRawJson(
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
