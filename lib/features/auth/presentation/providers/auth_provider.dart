import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_list_riverpod/features/auth/data/datasources/auth_fake_datasource.dart';
import 'package:flutter_todo_list_riverpod/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_todo_list_riverpod/features/auth/domain/entities/logged_user.dart';
import 'package:flutter_todo_list_riverpod/features/auth/domain/usecases/auth_usecases.dart';

class AuthNotifier extends AsyncNotifier<LoggedUser?> {
  late final AuthUseCases authUseCases;

  @override
  Future<LoggedUser?> build() async {
    authUseCases = AuthUseCases(AuthRepositoryImpl(AuthFakeDatasource()));
    return authUseCases.getLoggedUser();
  }

  Future<void> logout() async {
    try {
      state = const AsyncLoading();
      authUseCases.logout();
      state = AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<LoggedUser?> login(String pin) async {
    try {
      state = const AsyncLoading();
      LoggedUser? loggedUser = await authUseCases.login(pin);
      state = AsyncValue.data(loggedUser);
      return loggedUser;
    } catch (e, st) {
      state = AsyncError(e, st);
    }
    return null;
  }
}

final isAuthenticatedProvider =
    AsyncNotifierProvider<AuthNotifier, LoggedUser?>(() {
      return AuthNotifier();
    });
