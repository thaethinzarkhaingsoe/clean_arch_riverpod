import 'package:dio/dio.dart';

import '../local/storage/secure_storage.dart';


class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this.storage, required this.dioProvider});

  final AppSecureStorage storage;
  final Dio Function() dioProvider;
  bool _isRefreshing = false;
  final List<QueuedRequest> _queue = [];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.accessToken;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;

      // save the current request to replay later
      _queue.add(QueuedRequest(err.requestOptions, handler));

      try {
        final newTokens = await _refreshToken();
        if (newTokens != null) {
          await storage.saveTokens(
            accessToken: newTokens.accessToken,
            refreshToken: newTokens.refreshToken,
          );
          // replay queued requests
          for (final q in _queue) {
            final requestOptions = q.options;
            requestOptions.headers['Authorization'] = 'Bearer ${newTokens.accessToken}';
            final response = await dioProvider().fetch(requestOptions);
            q.handler.resolve(response);
          }
          _queue.clear();
          _isRefreshing = false;
          return;
        } else {
          // refresh failed -> fallthrough
        }
      } catch (_) {
        // fallthrough to logout
      } finally {
        _isRefreshing = false;
      }
    } else if (err.response?.statusCode == 401 && _isRefreshing) {
      // queue subsequent 401s while refresh in progress
      _queue.add(QueuedRequest(err.requestOptions, handler));
      return; // don't call handler.next yet
    }

    handler.next(err);
  }

  Future<_TokenPair?> _refreshToken() async {
    final rt = await storage.refreshToken;
    if (rt == null) return null;
    try {
      final resp = await dioProvider().post('/auth/refresh', data: {'refreshToken': rt});
      final data = resp.data as Map<String, dynamic>;
      return _TokenPair(
        accessToken: data['accessToken'] as String,
        refreshToken: data['refreshToken'] as String? ?? rt,
      );
    } catch (_) {
      await storage.clear();
      return null;
    }
  }
}

class QueuedRequest {
  QueuedRequest(this.options, this.handler);
  final RequestOptions options;
  final ErrorInterceptorHandler handler;
}

class _TokenPair {
  _TokenPair({required this.accessToken, required this.refreshToken});
  final String accessToken;
  final String refreshToken;
}