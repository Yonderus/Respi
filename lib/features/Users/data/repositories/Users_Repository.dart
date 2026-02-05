import '../models/Users.dart';

class Users_Repository {
  final List<User> _users = [
    User(
      usuarioId: 1,
      name: "Javi",
      surname: "Gisbert",
      email: "admin@respi.com",
      phone: "600111222",
      password: "adminRespi",
      role: UserRole.SUPER_ADMIN,
      isActive: true,
      fechaRegistro: DateTime.now(),
      fechaUltimoLogin: DateTime.now(),
      fechaNacimiento: DateTime(2005, 9, 27),
      direccion: "Centro Deportivo Respi",
    ),
  ];

  /// Buscar usuario por email (sin firstWhere, sin excepciones)
  Future<User?> getUserByEmail(String email) async {
    await Future.delayed(const Duration(milliseconds: 400));

    final normalizedEmail = email.trim().toLowerCase();

    for (User u in _users) {
      final userEmail = u.email.trim().toLowerCase();
      if (userEmail == normalizedEmail) {
        return u;
      }
    }

    // Si no encontramos nada, devolvemos null sin lanzar nada
    return null;
  }

  /// Registrar usuario nuevo
  Future<Object> registerUser(User user) async {
    await Future.delayed(const Duration(milliseconds: 400));

    final normalizedEmail = user.email.trim().toLowerCase();

    // Usamos el mismo criterio de comparación
    final exists = _users.any(
      (u) => u.email.trim().toLowerCase() == normalizedEmail,
    );

    if (exists) {
      return false; // email duplicado
    }

    user.usuarioId = _users.length + 1;
    user.fechaRegistro = DateTime.now();
    user.fechaUltimoLogin = DateTime.now();
    user.isActive = true;

    _users.add(user);

    return true;
  }
}
