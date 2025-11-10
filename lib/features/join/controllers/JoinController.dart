import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/join/data/models/CourtJoin.dart';
import 'package:respi/features/join/data/repositories/CourtJoin_Repository.dart';

class JoinNotifier extends AsyncNotifier<List<CourtJoin>> {
  late final CourtJoinRepository _repo;

  @override
  Future<List<CourtJoin>> build() async {
    _repo = CourtJoinRepository();
    return _repo.fetchAll();
  }
}

// Provider para el JoinNotifier
// Proporciona la lista de CourtJoin
final courtJoinProvider = AsyncNotifierProvider<JoinNotifier, List<CourtJoin>>(
  () {
    return JoinNotifier();
  },
);

// Provider para obtener el total de partidas disponibles
final totalJoinProvider = Provider<int>((ref) {
  final joins = ref.watch(courtJoinProvider).value ?? const <CourtJoin>[];
  return joins.length;
});
