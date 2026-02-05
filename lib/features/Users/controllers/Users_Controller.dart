import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/Users.dart';
import '../data/repositories/Users_Repository.dart';

class AuthNotifier extends AsyncNotifier<User?> {
  late final Users_Repository _repo;

  @override
  Future<User?> build() async {
    _repo = Users_Repository();
    return null; // inicial: sin usuario
  }

  Future<String?> login(String email, String password) async {
    state = const AsyncLoading();

    final user = await _repo.getUserByEmail(email);

    if (user == null) {
      state = const AsyncData(null);
      return "No existe ninguna cuenta con este email";
    }

    if (user.password != password) {
      state = const AsyncData(null);
      return "La contraseña es incorrecta";
    }

    user.fechaUltimoLogin = DateTime.now();

    state = AsyncData(user);
    return null;
  }

  Future<String?> register(User user) async {
    final existe = await _repo.getUserByEmail(user.email);

    if (existe != null) {
      return "Este email ya está registrado";
    }

    if (user.password.length < 8) {
      return "La contraseña debe ser de al menos 8 caractéres.";
    }

    //Explicación del formato: (Ni de coña ho faig sense buscar)
    /*
    | Parte       | Significado                                                    |
    | ----------- | -------------------------------------------------------------- |
    | `^[\w\.-]+` | nombre antes del @ (letras, números, punto, guion, guion bajo) |
    | `@`         | símbolo obligatorio                                            |
    | `[\w\.-]+`  | dominio (gmail, outlook, etc.)                                 |
    | `\.`        | punto antes del TLD                                            |
    | `\w+$`      | TLD (com, es, io, org…)                                        |

     */
    if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(user.email)) {
      return "Tiene que tener un formato email correcto";
    }

    await _repo.registerUser(user);

    return null;
  }

  void logout() {
    state = const AsyncData(null);
  }

  Future<String?> userUpdate(
    User user,
    String name,
    String password,
    String newPassword,
  ) async {
    // Validar contraseña actual solo si se quiere cambiar la contraseña
    if (newPassword.isNotEmpty) {
      if (user.password != password) {
        return "La contraseña actual es incorrecta";
      }

      if (password == newPassword) {
        return "No puedes cambiar la contraseña a la misma que tienes";
      }

      // Actualizar contraseña
      user.password = newPassword;
    }

    // Actualizar nombre solo si se indica uno nuevo
    if (name.isNotEmpty) {
      user.name = name;
    }

    state = AsyncData(user);

    return "Actualizado correctamente";
  }
}
