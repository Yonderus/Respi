import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/widgets/app_container_booking.dart';
import 'package:respi/features/bookingADD/data/models/bookingAdd.dart';

Widget listarReservas(
  List<BookingAdd> reservas,
  WidgetRef ref,
  bool showPopup,
) {
  return Column(
    children: reservas.map((reserva) {
      String imagePath;
      switch (reserva.sport.toLowerCase()) {
        case 'basket':
          imagePath = 'lib/assets/images/basketball-ball-variant.png';
          break;
        case 'futbol':
          imagePath = 'lib/assets/images/football.png';
          break;
        case 'pádel':
          imagePath = 'lib/assets/images/raqueta-de-padel.png';
          break;
        case 'tenis':
          imagePath = 'lib/assets/images/pelota-de-tenis.png';
          break;
        case 'voley':
          imagePath = 'lib/assets/images/juego.png';
          break;
        default:
          imagePath = 'lib/assets/images/default-sport.png';
      }

      return Column(
        children: [
          app_container_booking(
            route: imagePath,
            booking: reserva,
            showPopup: showPopup,
          ),
          const SizedBox(height: 10),
        ],
      );
    }).toList(),
  );
}
