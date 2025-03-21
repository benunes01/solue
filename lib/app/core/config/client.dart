import "dart:developer";

import "package:dio/dio.dart";

class Client {
  late Dio _dio;

  Client() {
    _dio = Dio();
    _dio.interceptors.add(ApiInterceptors());
    _dio.options.baseUrl = "https://dog.ceo/api/breeds/image/random";
    _dio.options.sendTimeout = const Duration(seconds: 60);
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
  }

  Dio get dio => _dio;
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log('REQUEST[${options.method}] => PATH: ${options.path}');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} - ${err.message}');
    return super.onError(err, handler);
  }
}
