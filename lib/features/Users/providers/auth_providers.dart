import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/Users_Controller.dart';
import '../data/models/Users.dart';

final authProvider = AsyncNotifierProvider<AuthNotifier, User?>(
  () => AuthNotifier(),
);

final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authProvider).value;
});
