// import 'package:apptest/core/data/local/flutter_secure_storage_const.dart';
// import 'package:apptest/core/data/local/flutter_secure_storage_provider.dart';
// import 'package:apptest/core/data/local/secure_storage_interface.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// import '../local/secure_storage_service.dart';
// import 'network_service.dart';
//
// final networkServiceInterceptorProvider = Provider<NetworkServiceInterceptor>((ref){
//   final secureStorage = ref.watch(secureStorageProvider);
//   return NetworkServiceInterceptor(secureStorage);
// });
//
//
// final class NetworkServiceInterceptor extends Interceptor{
//   final FlutterSecureStorage _secureStorage;
//   final Dio dio;
//   NetworkServiceInterceptor(this._secureStorage, this.dio);
//
//
//
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
//     final accessToken = await _secureStorage.read( key: accessTokenKey);
//     options.headers['Content-Type'] = 'application/json';
//     options.headers['Accept'] = 'application/json';
//     options.headers['Authorization'] = 'Bearer $accessToken';
//     super.onRequest(options, handler);
//   }
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // TODO: implement onResponse
//     super.onResponse(response, handler);
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async{
//     //handle unauthorized error /token expired need to refresh token
//     if(err.response?.statusCode == 401){
//       final token = await _secureStorage.read(key: refreshToken);
//     }
//     super.onError(err, handler );
//   }
// }