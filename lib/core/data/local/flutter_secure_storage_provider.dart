import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref){
  const androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );
  const iosOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  );

  return FlutterSecureStorage(
    aOptions: androidOptions,
    iOptions: iosOptions,
  );
});