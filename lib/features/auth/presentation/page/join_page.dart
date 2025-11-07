import 'package:flutter/material.dart';
import 'package:respi/core/widgets/app_container_join.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    List partidas = [
      {
        'text': 'Cancha de Basket 3 vs 3',
        'pricePerson': 5.0,
        'routeImage': 'lib/assets/images/fondo-basket.png',
        'personasNecesarias': 3,
        'level': 'Principiante',
      },
      {
        'text': 'Pista de Pádel Doble',
        'pricePerson': 7.0,
        'routeImage': 'lib/assets/images/fondo-padel.png',
        'personasNecesarias': 2,
        'level': 'Intermedio',
      },
      {
        'text': 'Campo de Fútbol 7',
        'pricePerson': 6.0,
        'routeImage': 'lib/assets/images/fondo-futbol.png',
        'personasNecesarias': 4,
        'level': 'Intermedio',
      },
      {
        'text': 'Cancha de Tenis Individual',
        'pricePerson': 4.0,
        'routeImage': 'lib/assets/images/fondo-tennis.png',
        'personasNecesarias': 1,
        'level': 'Principiante',
      },
      {
        'text': 'Cancha de Vóley Playa 2 vs 2',
        'pricePerson': 3.5,
        'routeImage': 'lib/assets/images/fondo-voleyball.png',
        'personasNecesarias': 2,
        'level': 'Intermedio',
      },
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),

          for (var partida in partidas)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: app_container_join(
                text: partida['text'],
                pricePerson: partida['pricePerson'],
                routeImage: partida['routeImage'],
                personasNecesarias: partida['personasNecesarias'],
                level: partida['level'],
              ),
            ),
        ],
      ),
    );
  }
}
