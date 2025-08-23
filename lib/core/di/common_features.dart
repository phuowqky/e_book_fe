library common_features;

import 'dart:developer';


import 'package:app_bong_da/core/network/api_service.dart';
import 'package:app_bong_da/core/util/constan.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

class CommonFeatures {
  static Future<void> init() async {
    getIt.registerSingleton<Dio>(DioBuilder.build());

    getIt.registerFactory<ApiService>(
      () => ApiService(
        getIt(),
        baseUrl: Constants.apiDomain,
      ),
    );
  }

  static Dio getDioInstance() {
    return GetIt.instance<Dio>();
  }

  static void setAuthorizationToken(String token) {
    // TODO: tạm thời ẩn đi.
    // đã gửi token lên BE. chưa check đc có gửi lên hệ thống khác ko
    // getIt<Dio>().options.headers["Authorization"] = "Bearer $token";
  }

  static void clearAuthorizationToken() {
    getIt<Dio>().options.headers.remove("Authorization");
  }
}

class DioBuilder {
  // static Dio build() {
  //   return Dio(BaseOptions(
  //     baseUrl: Constants.apiDomain,
  //     headers: {
  //       "Content-Type": "application/json",
  //       "Accept": "application/json",
  //     },
  //     extra: {
  //       "withCredentials": false,
  //     },
  //   ));
  // }

  static Dio build() {
    Dio dio = Dio(BaseOptions(
      baseUrl: Constants.apiDomain,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      extra: {
        "withCredentials": false,
      },
    ));

    dio.interceptors.add(LoggingInterceptor());

    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ));

    return dio;
  }
}

class LoggingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("API Error on ${err.requestOptions.path}");
    log("Status Code: ${err.response?.statusCode}");
    log("Error: ${err.message}");
    log("Stacktrace: ${StackTrace.current.toString().split('\n')[0]}");

    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Xóa các query có value null hoặc ''
    options.queryParameters.removeWhere(
      (key, value) => (value == null ||
          (value is String && value.trim().isEmpty) ||
          value == ''),
    );

    super.onRequest(options, handler);
  }
}
