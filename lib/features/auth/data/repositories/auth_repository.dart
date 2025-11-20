import 'dart:convert';
import 'package:respi/core/utils/app_services.dart';
import 'package:respi/core/utils/constants.dart';
import 'package:respi/features/Users/data/models/Users.dart';

class AuthRepository {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await AppServices.dio.post(
      'https://dummyjson.com/auth/login',

      data: jsonEncode({
        'username': email,
        'password': password,
        'expiresInMins': 30,
      }),
    );
    final data = response.data as Map<String, dynamic>;
    final token = data['accessToken'] as String?;
    // final refreshToken = data['refreshToken'] as String?;
    if (token == null) throw Exception('No se recibió token');

    await AppServices.storage.write(key: tokenKey, value: token);
    // if (refreshToken != null) {
    //   await AppServices.storage.write(key: refreshKey, value: refreshToken);
    // }
    return data;
  }

  // Future<User> getLoggedUserData() async {
  //   final response = await AppServices.dio.get('/auth/me');
  //   // return User.fromMap(response.data as Map<String, dynamic>);
  // }

  Future<void> logout() async {
    await AppServices.storage.delete(key: tokenKey);
    await AppServices.storage.delete(key: refreshKey);
  }

  Future<String?> readToken() => AppServices.storage.read(key: tokenKey);
}
