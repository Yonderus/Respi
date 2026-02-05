import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  TokenStorage({
    FlutterSecureStorage? secureStorage,
    SharedPreferences? sharedPreferences,
  })  : _secureStorage = secureStorage,
        _sharedPreferences = sharedPreferences;

  final FlutterSecureStorage? _secureStorage;
  final SharedPreferences? _sharedPreferences;

  FlutterSecureStorage get _resolvedSecureStorage =>
      _secureStorage ??
      const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
        iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
      );

  Future<SharedPreferences> get _resolvedSharedPreferences async =>
      _sharedPreferences ?? SharedPreferences.getInstance();

  Future<void> write({required String key, required String value}) async {
    if (kIsWeb) {
      final prefs = await _resolvedSharedPreferences;
      await prefs.setString(key, value);
      return;
    }
    await _resolvedSecureStorage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    if (kIsWeb) {
      final prefs = await _resolvedSharedPreferences;
      return prefs.getString(key);
    }
    return _resolvedSecureStorage.read(key: key);
  }

  Future<void> delete({required String key}) async {
    if (kIsWeb) {
      final prefs = await _resolvedSharedPreferences;
      await prefs.remove(key);
      return;
    }
    await _resolvedSecureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    if (kIsWeb) {
      final prefs = await _resolvedSharedPreferences;
      await prefs.clear();
      return;
    }
    await _resolvedSecureStorage.deleteAll();
  }
}
