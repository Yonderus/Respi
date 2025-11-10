import 'package:respi/features/join/data/models/CourtJoin.dart';

class CourtJoinRepository {
  final _courtJoinList = <CourtJoin>[
    CourtJoin(
      text: 'Cancha de Basket 3 vs 3',
      pricePerson: 5.0,
      routeImage: 'lib/assets/images/fondo-basket.png',
      personasNecesarias: 3,
      level: 'Principiante',
    ),
    CourtJoin(
      text: 'Pista de Pádel Doble',
      pricePerson: 7.0,
      routeImage: 'lib/assets/images/fondo-padel.png',
      personasNecesarias: 2,
      level: 'Intermedio',
    ),
    CourtJoin(
      text: 'Campo de Fútbol 7',
      pricePerson: 6.0,
      routeImage: 'lib/assets/images/fondo-futbol.png',
      personasNecesarias: 4,
      level: 'Intermedio',
    ),
    CourtJoin(
      text: 'Cancha de Tenis Individual',
      pricePerson: 4.0,
      routeImage: 'lib/assets/images/fondo-tennis.png',
      personasNecesarias: 1,
      level: 'Principiante',
    ),
    CourtJoin(
      text: 'Cancha de Vóley Playa 2 vs 2',
      pricePerson: 3.5,
      routeImage: 'lib/assets/images/fondo-voleyball.png',
      personasNecesarias: 2,
      level: 'Intermedio',
    ),
  ];

  Future<List<CourtJoin>> fetchAll() async {
    await Future<void>.delayed(const Duration(milliseconds: 1500));
    return _courtJoinList;
  }
}
