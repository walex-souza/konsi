import 'package:dio/dio.dart';

class DioService {
  static final DioService _instance = DioService._internal();
  factory DioService() => _instance;

  late Dio dio;

  DioService._internal() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://viacep.com.br/ws/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
    ));
  }
}
