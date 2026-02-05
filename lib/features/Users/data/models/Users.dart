enum UserRole {
  GESTOR_RESERVAS,
  ADMINISTRACION,
  CLIENTE,
  MANTENIMIENTO,
  SUPER_ADMIN,
}

class User {
  int? usuarioId;

  String name;
  String surname;
  String email;
  String phone;
  String password;

  UserRole role;

  bool isActive;
  DateTime fechaRegistro;
  DateTime fechaUltimoLogin;
  DateTime fechaNacimiento;
  String direccion;

  User({
    this.usuarioId,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
    required this.isActive,
    required this.fechaRegistro,
    required this.fechaUltimoLogin,
    required this.fechaNacimiento,
    required this.direccion,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      usuarioId: json['usuario_id'],
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',
      role: UserRole.values.firstWhere(
        (r) => r.toString().split('.').last == json['role'],
        orElse: () => UserRole.CLIENTE,
      ),
      isActive: json['isActive'] ?? json['is_active'] ?? true,
      fechaRegistro:
          DateTime.tryParse(json['fecha_registro'] ?? '') ?? DateTime.now(),
      fechaUltimoLogin:
          DateTime.tryParse(json['fecha_ultimo_login'] ?? '') ?? DateTime.now(),
      fechaNacimiento:
          DateTime.tryParse(json['fecha_nacimiento'] ?? '') ?? DateTime.now(),
      direccion: json['direccion'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'usuario_id': usuarioId,
      'name': name,
      'surname': surname,
      'email': email,
      'phone': phone,
      'password': password,
      'role': role.toString().split('.').last,
      'isActive': isActive,
      'fecha_registro': fechaRegistro.toIso8601String(),
      'fecha_ultimo_login': fechaUltimoLogin.toIso8601String(),
      'fecha_nacimiento': fechaNacimiento.toIso8601String(),
      'direccion': direccion,
    };
  }
}
