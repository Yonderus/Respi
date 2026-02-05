import 'package:dio/dio.dart';
import 'package:respi/core/utils/app_services.dart';
import 'package:respi/core/utils/constants.dart';
import '../models/Users.dart';

class Users_Repository {
  final Dio _dio;

  Users_Repository({Dio? dio}) : _dio = dio ?? AppServices.dio;

  Future<User> login({required String email, required String password}) async {
    final response = await _dio.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );

    if (!_isSuccess(response.statusCode)) {
      throw Exception(_errorFromResponse(response));
    }

    final data = response.data;
    if (data is Map<String, dynamic>) {
      await _persistTokens(data);
      final user = _extractUser(data, fallbackEmail: email);
      if (user != null) return user;
    }

    return User(
      usuarioId: null,
      name: '',
      surname: '',
      email: email,
      phone: '',
      password: '',
      role: UserRole.CLIENTE,
      isActive: true,
      fechaRegistro: DateTime.now(),
      fechaUltimoLogin: DateTime.now(),
      fechaNacimiento: DateTime.now(),
      direccion: '',
    );
  }

  Future<User?> registerUser(User user) async {
    final response = await _dio.post(
      '/auth/register',
      data: {
        'name': user.name,
        'surname': user.surname,
        'email': user.email,
        'phone': user.phone,
        'password': user.password,
        'fecha_nacimiento': user.fechaNacimiento.toIso8601String(),
        'direccion': user.direccion,
      },
    );

    if (!_isSuccess(response.statusCode)) {
      throw Exception(_errorFromResponse(response));
    }

    final data = response.data;
    if (data is Map<String, dynamic>) {
      await _persistTokens(data);
      return _extractUser(data, fallbackEmail: user.email);
    }

    return user;
  }

  Future<void> clearSession() async {
    await AppServices.storage.delete(key: tokenKey);
    await AppServices.storage.delete(key: refreshKey);
  }

  bool _isSuccess(int? statusCode) {
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  Future<void> _persistTokens(Map<String, dynamic> data) async {
    final accessToken =
        data['access_token'] ??
        data['accessToken'] ??
        data['token'] ??
        data['jwt'];
    final refreshToken =
        data['refresh_token'] ?? data['refreshToken'] ?? data['refresh'];

    if (accessToken is String && accessToken.isNotEmpty) {
      await AppServices.storage.write(key: tokenKey, value: accessToken);
    }
    if (refreshToken is String && refreshToken.isNotEmpty) {
      await AppServices.storage.write(key: refreshKey, value: refreshToken);
    }
  }

  User? _extractUser(Map<String, dynamic> data, {String? fallbackEmail}) {
    final dynamic rawUser =
        data['user'] ??
        data['usuario'] ??
        data['profile'] ??
        data['data'] ??
        data['result'];

    if (rawUser is Map<String, dynamic>) {
      return User.fromJson(rawUser);
    }

    final name = data['name'];
    final surname = data['surname'];
    final email = data['email'] ?? fallbackEmail;
    if (email is String) {
      return User(
        usuarioId: data['usuario_id'] ?? data['id'],
        name: name is String ? name : '',
        surname: surname is String ? surname : '',
        email: email,
        phone: (data['phone'] is String) ? data['phone'] : '',
        password: '',
        role: _roleFromJson(data['role']),
        isActive: data['isActive'] is bool
            ? data['isActive']
            : (data['is_active'] is bool ? data['is_active'] : true),
        fechaRegistro: _parseDate(data['fecha_registro']),
        fechaUltimoLogin: _parseDate(data['fecha_ultimo_login']),
        fechaNacimiento: _parseDate(data['fecha_nacimiento']),
        direccion: (data['direccion'] is String) ? data['direccion'] : '',
      );
    }

    return null;
  }

  UserRole _roleFromJson(dynamic role) {
    if (role is String) {
      return UserRole.values.firstWhere(
        (r) => r.toString().split('.').last == role,
        orElse: () => UserRole.CLIENTE,
      );
    }
    return UserRole.CLIENTE;
  }

  DateTime _parseDate(dynamic value) {
    if (value is String && value.isNotEmpty) {
      return DateTime.tryParse(value) ?? DateTime.now();
    }
    return DateTime.now();
  }

  String _errorFromResponse(Response response) {
    final data = response.data;
    if (data is Map<String, dynamic>) {
      final msg =
          data['message'] ?? data['error'] ?? data['detail'] ?? data['mensaje'];
      if (msg is String && msg.isNotEmpty) {
        return msg;
      }
      if (msg is List && msg.isNotEmpty && msg.first is String) {
        return msg.first as String;
      }
    }
    final status = response.statusCode;
    if (status != null) {
      return 'Error $status en el servidor';
    }
    return 'Error de conexión con el servidor';
  }
}
