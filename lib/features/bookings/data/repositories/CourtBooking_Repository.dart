import 'package:respi/features/bookings/data/models/CourtBooking.dart';

class CourtBookingRepository {
  final _courtList = <CourtBooking>[
    CourtBooking(
      sport: 'Basket',
      routeImg: 'lib/assets/images/fondo-basket.png',
      text: 'Cancha de Baloncesto',
      price: '27',
      etiqueta1: 'Concreto',
      etiqueta2: 'Exterior',
    ),
    CourtBooking(
      sport: 'Pádel',
      routeImg: 'lib/assets/images/fondo-padel.png',
      text: 'Pista de Pádel Indoor',
      price: '20',
      etiqueta1: 'Cubierta',
      etiqueta2: 'Iluminada',
    ),
    CourtBooking(
      sport: 'Futbol',
      routeImg: 'lib/assets/images/fondo-futbol.png',
      text: 'Campo de Fútbol 11',
      price: '20',
      etiqueta1: 'Césped',
      etiqueta2: 'Iluminado',
    ),
    CourtBooking(
      sport: 'Tenis',
      routeImg: 'lib/assets/images/fondo-tennis.png',
      text: 'Pista de Tenis',
      price: '15',
      etiqueta1: 'Arcilla',
      etiqueta2: 'Exterior',
    ),
    CourtBooking(
      sport: 'Pádel',
      routeImg: 'lib/assets/images/fondo-padel.png',
      text: 'Pista de Pádel',
      price: '18',
      etiqueta1: 'Cubierta',
      etiqueta2: 'Iluminada',
    ),
    CourtBooking(
      sport: 'Basket',
      routeImg: 'lib/assets/images/fondo-basket.png',
      text: 'Cancha de Baloncesto Exterior',
      price: '25',
      etiqueta1: 'Concreto',
      etiqueta2: 'Exterior',
    ),
  ];

  // Simula la obtención de todas las pistas
  Future<List<CourtBooking>> fetchAll() async {
    // Simulamos un retardo de 3 segundos
    await Future<void>.delayed(const Duration(milliseconds: 1500));
    return _courtList;
  }

  // Simula la obtención de pistas filtradas por deporte
  Future<List<CourtBooking>> fetchBySport(String sport) async {
    await Future<void>.delayed(const Duration(milliseconds: 1500));
    return _courtList
        .where((court) => court.sport.toLowerCase() == sport.toLowerCase())
        .toList();
  }
}
