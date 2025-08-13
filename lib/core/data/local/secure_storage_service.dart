import 'package:apptest/core/data/local/secure_storage_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'flutter_secure_storage_provider.dart';

final secureStorage = Provider<InterfaceSecureStorage>((ref){
  final secureStorage = ref.watch(secureStorageProvider);
  return SecureStorage(secureStorage);
});

final class SecureStorage implements InterfaceSecureStorage{
  final FlutterSecureStorage _flutterSecureStorage ;

  SecureStorage(this._flutterSecureStorage);

  @override
  Future<void> delete(String key) async{
    try{
      await _flutterSecureStorage.delete(key: key);
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<String> read(String key) async{
    try{
      return await _flutterSecureStorage.read(key: key) ?? '';
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<void> write(String key, String value) {
    try{
      return _flutterSecureStorage.write(key: key, value: value);
    }catch(e){
      rethrow;
    }
  }
  
}