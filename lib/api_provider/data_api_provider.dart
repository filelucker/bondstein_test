import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../api/ApiResponse.dart';
import '../models/store_response.dart';
import '../models/submit_data_request.dart';
import '../models/submit_data_response.dart';
import 'dio/base_api_provider.dart';

class DataApiProvider extends BaseApiProvider {
  Future<ApiResponse<SubmitDataResponse>> submitData(
      SubmitDataRequest model) async {
    try {
      Response response = await getDio()
          .post('api/attendance', queryParameters: model.toJson());
      print(response.data);
      return ApiResponse<SubmitDataResponse>(
          data: SubmitDataResponse.fromJson(response.data), error: false);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return ApiResponse<SubmitDataResponse>(
          errorMessage: handleError(error), error: true);
    }
  }

  Future<ApiResponse<StoreResponse>> getStoreList(page) async {
    try {
      Response response =
          await getDio().get('api/stores?page=' + page.toString());
      return ApiResponse<StoreResponse>(
          data: StoreResponse.fromJson(response.data), error: false);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return ApiResponse<StoreResponse>(
          errorMessage: handleError(error), error: true);
    }
  }
}
