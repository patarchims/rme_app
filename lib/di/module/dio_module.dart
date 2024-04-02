import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  Dio get dio {
    final dio = Dio();
    dio.options.connectTimeout = 30000 as Duration?; // 30s
    dio.interceptors.addAll([
      LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
        request: true,
        requestBody: true,
      ),
    ]);
    return dio;
  }
}
