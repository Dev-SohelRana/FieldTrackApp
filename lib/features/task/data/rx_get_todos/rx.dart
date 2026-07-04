// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:field_track_app/features/task/model/get_todos_response_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../../helpers/toast.dart';
import '../../../../../../../networks/rx_base.dart';
import 'api.dart';

final class GetTodosRX extends RxResponseInt<GetTodosResponseModel> {
  final api = GetTodosApi.instance;

  GetTodosRX({required super.empty, required super.dataFetcher});

  ValueStream get articleSteam => dataFetcher.stream;

  Future<void> getTodosRX() async {
    try {
      GetTodosResponseModel data = await api.getTodosApi();
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
