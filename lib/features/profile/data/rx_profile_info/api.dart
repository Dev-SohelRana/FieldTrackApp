import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:field_track_app/features/profile/model/profile_info_response_model.dart';
import '../../../../../../../networks/dio/dio.dart';
import '../../../../../../../networks/endpoints.dart';

final class ProfileInfoApi {
  static final ProfileInfoApi _singleton = ProfileInfoApi._internal();
  ProfileInfoApi._internal();
  static ProfileInfoApi get instance => _singleton;

  Future<ProfileInfoResponseModel> profileInfoApi() async {
    try {
      Response response = await getHttp(Endpoints.userProfile());

      if (response.statusCode == 200) {
        return ProfileInfoResponseModel.fromRawJson(json.encode(response.data));
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException {
      rethrow;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
