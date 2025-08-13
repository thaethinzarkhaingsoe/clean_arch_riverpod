// import 'package:apptest/core/data/network/network_service_interceptor.dart';
// import 'package:dio/dio.dart';
// import 'package:dio_http_formatter/dio_http_formatter.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// final networkServiceProvider = Provider<Dio>((ref){
// final options = BaseOptions(
// baseUrl: 'https://jsonplaceholder.typicode.com',
//     sendTimeout : const Duration(seconds: 60),
//     receiveTimeout: const Duration(seconds: 60),
//     connectTimeout: const Duration(seconds: 60),
// );
// final dio = Dio(options);
// final networkServiceInterceptor = ref.watch(networkInterceptorProvider(dio));
// dio.interceptors.addAll([
//     HttpFormatter(),
//     networkServiceInterceptor,
// ]);
//
// return dio;
// });
