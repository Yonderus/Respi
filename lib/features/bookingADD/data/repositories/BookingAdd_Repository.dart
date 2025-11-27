import 'package:respi/features/bookingADD/data/models/bookingAdd.dart';

class BookingAddRepository {
  final _bookingList = <BookingAdd>[];

  Future<void> addBooking(BookingAdd booking) async {
    // Simula una operación asíncrona, como una llamada a una API o una base de datos
    await Future.delayed(const Duration(milliseconds: 500));
    _bookingList.add(booking);
  }

  Future<void> updateBooking(BookingAdd booking) async {
    // Simula una operación asíncrona
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _bookingList.indexWhere((b) => b.id == booking.id);
    if (index != -1) {
      _bookingList[index] = booking;
    }
  }

  // Simula la obtención de todas las pistas reservadas
  Future<List<BookingAdd>> fetchAll() async {
    // Simula una operación asíncrona
    await Future.delayed(const Duration(milliseconds: 500));
    return _bookingList;
  }
}
