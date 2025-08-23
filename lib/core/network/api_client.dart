// import 'package:dio/dio.dart';

// class ApiClient {
//   static final Dio dio = Dio(
//     BaseOptions(
//       baseUrl: "",
//       connectTimeout: Duration(seconds: 30),
//       receiveTimeout: Duration(seconds: 30),
//     ),
//   );
// }

import 'package:app_bong_da/core/di/common_features.dart';
import 'package:app_bong_da/data/storage/user_storage.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioBuilder {
  static const defaultHeaders = <String, String>{
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
    "Content-Type": "application/json",
  };

  static Dio build({String baseUrl = ''}) {
    final dio = Dio();
    final options = dio.options.copyWith(
      baseUrl: baseUrl,
      headers: defaultHeaders,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
    );

    dio.options = options;
    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(requestBody: true));
      dio.interceptors.add(
        CurlLoggerDioInterceptor(printOnSuccess: true),
      );
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.queryParameters.removeWhere(
            (key, value) =>
                value == null ||
                (value is String && value.trim().isEmpty) ||
                value == '',
          );

          final token = await UserStorage.getToken();
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options); // tiếp tục request
        },
      ),
    );

    return dio;
  }

  static insertDioHeader(Map<String, dynamic>? headerInsert) {
    if (headerInsert != null) getIt<Dio>().options.headers.addAll(headerInsert);
  }

  static Map<String, dynamic> getDioHeader() {
    return getIt<Dio>().options.headers;
  }
}
