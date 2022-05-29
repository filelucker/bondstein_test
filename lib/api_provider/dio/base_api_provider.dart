import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'logging_interceptor.dart';

class BaseApiProvider {
  static final String _baseUrl = dotenv.env['BASE_URL'] as String;

  static const String _contentType = 'Content-Type';

  late Dio _dio;

  BaseApiProvider() {
    BaseOptions dioOptions = BaseOptions(
      baseUrl: _baseUrl,
      headers: {_contentType: 'application/json'},
    );
    _dio = Dio(dioOptions)..interceptors.add(LoggingInterceptors());
  }

  Dio getDio() => _dio;

  String handleError(error) {
    String errorDescription = "";
    switch (error.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        errorDescription =
            "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        errorDescription =
            "Received invalid status code: ${error.response!.statusCode}";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
    }
    return errorDescription;
  }
}
