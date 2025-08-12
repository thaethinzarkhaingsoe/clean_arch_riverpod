import 'package:apptest/core/data/local/flutter_secure_storage_const.dart';
import 'package:apptest/core/data/local/flutter_secure_storage_provider.dart';
import 'package:apptest/core/data/local/secure_storage_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../local/secure_storage_service.dart';
import 'network_service.dart';

final networkServiceInterceptorProvider =
Provider.family<NetworkServiceInterceptor, Dio>((ref, dio) {
  final tokenService = ref.watch(tokenServiceProvider(dio));

  return NetworkServiceInterceptor(tokenService, dio);
});



final class NetworkServiceInterceptor extends Interceptor{
  final ITokenService _tokenService;
  final Dio _dio;

  NetworkServiceInterceptor(this._tokenService, this._dio);


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    final accessToken = await _interfaceStorage.read(accessTokenKey);
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers['Authorization'] = 'Bearer $accessToken';
    super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
  }
}