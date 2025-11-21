import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/Users/data/models/Users.dart';
import 'package:respi/features/Users/providers/auth_providers.dart';

final currentUserProvider = Provider<User?>((ref) {
  final authState = ref.watch(authProvider);
  return authState.value;
});
