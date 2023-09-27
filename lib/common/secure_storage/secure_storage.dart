
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {

  static final SecureStorage _singleton = SecureStorage._internal();

  factory SecureStorage() {
    return _singleton;
  }

  SecureStorage._internal();

  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true
    )
  );

  static const _tokenField = "token";

  Future<String?> getToken() async {
    return await storage.read(key: _tokenField);
  }

  Future<void> setToken(String token) async {
    await storage.write(key: _tokenField, value: token);
  }
}
