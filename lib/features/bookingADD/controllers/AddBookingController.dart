import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/bookingADD/data/models/bookingAdd.dart';
import 'package:respi/features/bookingADD/data/repositories/BookingAdd_Repository.dart';
import 'package:respi/providers/booking_repo_provider.dart';

class AddBookingController extends AsyncNotifier<List<BookingAdd>> {
  late final BookingAddRepository _repo;

  @override
  Future<List<BookingAdd>> build() async {
    _repo = ref.read(bookingRepoProvider);
    return _repo.fetchAll();
  }

  Future<void> addNewBooking(BookingAdd booking) async {
    state = const AsyncLoading();
    await _repo.addBooking(booking);
    state = AsyncValue.data(await _repo.fetchAll());
  }

  Future<void> updateBooking(BookingAdd booking) async {
    state = const AsyncLoading();
    await _repo.updateBooking(booking);
    state = AsyncValue.data(await _repo.fetchAll());
  }

  Future<void> deleteBooking(BookingAdd booking) async {
    state = const AsyncLoading();
    await _repo.deleteBooking(booking);
    state = AsyncValue.data(await _repo.fetchAll());
  }
}

// Provider para usar el controller en cualquier widget
final bookingAddProvider =
    AsyncNotifierProvider<AddBookingController, List<BookingAdd>>(
      () => AddBookingController(),
    );
