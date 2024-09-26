import 'package:dio/dio.dart';

class DioService {
  static final DioService _instance = DioService._internal();
  factory DioService() => _instance;

  late Dio dio;

  DioService._internal() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://viacep.com.br/ws/', // URL base para a API de CEPs
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    // Adicionar logs das requisições
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
    ));
  }
}
