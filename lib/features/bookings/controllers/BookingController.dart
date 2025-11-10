import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/bookings/data/models/CourtBooking.dart';
import 'package:respi/features/bookings/data/repositories/CourtBooking_Repository.dart';

class BookingNotifier extends AsyncNotifier<List<CourtBooking>> {
  late final CourtBookingRepository _repo;

  // Lista todas las pistas de la base de datos
  @override
  Future<List<CourtBooking>> build() async {
    _repo = CourtBookingRepository();
    return _repo.fetchAll();
  }

  //Filtra las pistad por el deporte seleccionado, si no hay filtro, muestra todas
  Future<void> filterBySport(String sport) async {
    state = const AsyncLoading();
    if (sport == "Todos") {
      state = AsyncValue.data(await _repo.fetchAll());
    } else {
      state = AsyncValue.data(await _repo.fetchBySport(sport));
    }
  }
}

// Provider para el BookingNotifier
// Proporciona la lista de CourtBooking
final courtBookingProvider =
    AsyncNotifierProvider<BookingNotifier, List<CourtBooking>>(() {
      return BookingNotifier();
    });

// Provider para obtener el total de pistas disponibles
final totalTodosProvider = Provider<int>((ref) {
  final todos = ref.watch(courtBookingProvider).value ?? const <CourtBooking>[];
  return todos.length;
});
