/*
      FUNCIÓN PARA LISTAR RESERVAS
      Para evitar repetir código
*/

import 'package:flutter/material.dart';
import 'package:respi/core/widgets/app_container_booking.dart';

Widget listarReservas(List reservas) {
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
            sport: reserva.sport,
            data: reserva.day,
            timeIni: reserva.timeIni,
            timeFin: reserva.timeFin,
            locate: reserva.location,
          ),
          const SizedBox(height: 10),
        ],
      );
    }).toList(),
  );
}
