import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:respi/features/bookings/data/models/CourtBooking.dart';

/// Provider to hold the currently selected court for booking
final selectedBookingProvider = StateProvider<CourtBooking?>((ref) => null);
