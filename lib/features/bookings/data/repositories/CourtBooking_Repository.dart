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
      location: 'Pista Exterior, Centro Deportivo Respi',
      capacity: '10 personas',
      caracteristics1: 'Iluminación LED',
      caracteristics2: 'Suelo de parquet antideslizante',
      caracteristics3: 'Sistema de ventilación avanzado',
      caracteristics4: '',
      description:
          'Cancha de baloncesto con iluminación LED, suelo de parquet antideslizante y sistema de ventilación avanzado.',
    ),
    CourtBooking(
      sport: 'Pádel',
      routeImg: 'lib/assets/images/fondo-padel.png',
      text: 'Pista de Pádel Indoor',
      price: '20',
      etiqueta1: 'Cubierta',
      etiqueta2: 'Iluminada',
      location: 'Pista Indoor, Centro Deportivo Respi',
      capacity: '4 personas',
      caracteristics1: 'Ventanales panorámicos',
      caracteristics2: 'Suelo de césped artificial',
      caracteristics3: 'Iluminación LED de alta eficiencia',
      caracteristics4: 'Palas de pádel disponibles',
      description:
          'Pista de pádel indoor con ventanales panorámicos, suelo de césped artificial e iluminación LED de alta eficiencia.',
    ),
    CourtBooking(
      sport: 'Futbol',
      routeImg: 'lib/assets/images/fondo-futbol.png',
      text: 'Campo de Fútbol 11',
      price: '20',
      etiqueta1: 'Césped',
      etiqueta2: 'Iluminado',
      location: 'Campo Exterior, Centro Deportivo Respi',
      capacity: '22 personas',
      caracteristics1: 'Césped natural de alta calidad',
      caracteristics2: 'Iluminación nocturna',
      caracteristics3: '',
      caracteristics4: '',
      description:
          'Campo de fútbol 11 con césped natural de alta calidad e iluminación nocturna.',
    ),
    CourtBooking(
      sport: 'Tenis',
      routeImg: 'lib/assets/images/fondo-tennis.png',
      text: 'Pista de Tenis',
      price: '15',
      etiqueta1: 'Arcilla',
      etiqueta2: 'Exterior',
      location: 'Pista Exterior, Centro Deportivo Respi',
      capacity: '4 personas',
      caracteristics1: 'Superficie de arcilla profesional',
      caracteristics2: 'Red de alta resistencia',
      caracteristics3: '',
      caracteristics4: '',
      description:
          'Pista de tenis con superficie de arcilla profesional y red de alta resistencia.',
    ),
    CourtBooking(
      sport: 'Pádel',
      routeImg: 'lib/assets/images/fondo-padel.png',
      text: 'Pista de Pádel',
      price: '18',
      etiqueta1: 'Cubierta',
      etiqueta2: 'Iluminada',
      location: 'Pista Indoor, Centro Deportivo Respi',
      capacity: '4 personas',
      caracteristics1: 'Ventilación avanzada',
      caracteristics2: 'Suelo de corcho antideslizante',
      caracteristics3: 'Iluminación LED de alta eficiencia',
      caracteristics4: '',
      description:
          'Pista de pádel cubierta con ventilación avanzada y suelo de corcho antideslizante.',
    ),
    CourtBooking(
      sport: 'Basket',
      routeImg: 'lib/assets/images/fondo-basket.png',
      text: 'Cancha de Baloncesto Exterior',
      price: '25',
      etiqueta1: 'Concreto',
      etiqueta2: 'Exterior',
      location: 'Pista Exterior, Centro Deportivo Respi',
      capacity: '3 personas',
      caracteristics1: 'Iluminación LED',
      caracteristics2: 'Tableros resistentes a la intemperie',
      caracteristics3: '',
      caracteristics4: '',
      description:
          'Cancha de baloncesto con iluminación LED y tableros resistentes a la intemperie.',
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
