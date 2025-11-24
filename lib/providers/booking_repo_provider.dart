import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/bookingADD/data/repositories/BookingAdd_Repository.dart';

final bookingRepoProvider = Provider((ref) => BookingAddRepository());
