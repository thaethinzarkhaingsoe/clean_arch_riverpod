import 'package:dio/dio.dart';

import '../local/storage/secure_storage.dart';
import 'AppConfig.dart';
import 'auth_interceptor.dart';


class DioClient {
  DioClient({
    required AppConfig config,
    required AppSecureStorage storage,
  }) {
    dio = Dio(BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 20),
      contentType: 'application/json',
    ));
    dio.interceptors.add(AuthInterceptor(storage: storage, dioProvider: () => dio));
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  late final Dio dio;
}