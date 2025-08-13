
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage{
  final FlutterSecureStorage _storage;
  AppSecureStorage(this._storage);
  static const String _kaccessTokenKey = 'accessToken';
  static const String _krefreshToken = 'refresh_token';

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
})async{
    await _storage.write(key: _kaccessTokenKey, value: accessToken);
    await _storage.write(key: _krefreshToken, value: refreshToken);
  }
  Future<String?> get accessToken async => await _storage.read(key: _kaccessTokenKey);
  Future<String?> get refreshToken async => await _storage.read(key: _krefreshToken);

  Future<void> clear() async{
    await _storage.delete(key: _kaccessTokenKey);
    await _storage.delete(key: _krefreshToken);

  }
}