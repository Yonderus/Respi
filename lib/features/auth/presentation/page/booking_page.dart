import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_container_info.dart';
import 'package:respi/core/widgets/app_menuSports.dart';

/// Página de reservas — muestra las pistas disponibles según el deporte seleccionado.
class BookingPage extends ConsumerStatefulWidget {
  const BookingPage({super.key});

  @override
  ConsumerState<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends ConsumerState<BookingPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Lista de pistas deportivas disponibles
    final pistas = [
      {
        'sport': 'Basket',
        'routeImg': 'lib/assets/images/fondo-basket.png',
        'text': 'Cancha de Baloncesto',
        'price': '27',
        'etiqueta1': 'Concreto',
        'etiqueta2': 'Exterior',
      },
      {
        'sport': 'Pádel',
        'routeImg': 'lib/assets/images/fondo-padel.png',
        'text': 'Pista de Pádel Indoor',
        'price': '20',
        'etiqueta1': 'Cubierta',
        'etiqueta2': 'Iluminada',
      },
      {
        'sport': 'Futbol',
        'routeImg': 'lib/assets/images/fondo-futbol.png',
        'text': 'Campo de Fútbol 11',
        'price': '20',
        'etiqueta1': 'Césped',
        'etiqueta2': 'Iluminado',
      },
      {
        'sport': 'Tenis',
        'routeImg': 'lib/assets/images/fondo-tennis.png',
        'text': 'Pista de Tenis',
        'price': '15',
        'etiqueta1': 'Arcilla',
        'etiqueta2': 'Exterior',
      },
      {
        'sport': 'Pádel',
        'routeImg': 'lib/assets/images/fondo-padel.png',
        'text': 'Pista de Pádel',
        'price': '18',
        'etiqueta1': 'Cubierta',
        'etiqueta2': 'Iluminada',
      },
      {
        'sport': 'Basket',
        'routeImg': 'lib/assets/images/fondo-basket.png',
        'text': 'Cancha de Baloncesto Indoor',
        'price': '30',
        'etiqueta1': 'Plastico',
        'etiqueta2': 'Cubierta',
      },
      {
        'sport': 'Voley',
        'routeImg': 'lib/assets/images/fondo-voleyball.png',
        'text': 'Pista de Voley',
        'price': '22',
        'etiqueta1': 'Arena',
        'etiqueta2': 'Exterior',
      },
      {
        'sport': 'Futbol',
        'routeImg': 'lib/assets/images/fondo-futbol.png',
        'text': 'Campo de Fútbol 7',
        'price': '11',
        'etiqueta1': 'Concreto',
        'etiqueta2': 'Interior',
      },
    ];

    // Leemos el deporte seleccionado desde Riverpod
    // (AppMenuSports actualiza este valor)
    final String selected = ref.watch(selectedSportProvider);

    return SingleChildScrollView(
      // ConstrainedBox asegura que el contenido mínimo
      // ocupe al menos la altura de la pantalla completa
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // MENÚ DE DEPORTES
            AppMenusports(),

            const SizedBox(height: 10),

            // TÍTULO
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '${l10n.selectcamp}:',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // LISTA DE PISTAS FILTRADAS
            // Se usa .where() directamente dentro del for para mostrar
            // solo las que coinciden con el deporte seleccionado.
            // Si el usuario selecciona “Todos”, se muestran todas.
            for (final pista in pistas.where(
              (p) => selected == 'Todos' || p['sport'] == selected,
            ))
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: app_container_info(
                    routeImg: pista['routeImg'] as String,
                    text: pista['text'] as String,
                    price: pista['price'] as String,
                    etiqueta1: pista['etiqueta1'] as String,
                    etiqueta2: pista['etiqueta2'] as String,
                  ),
                ),
              ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
