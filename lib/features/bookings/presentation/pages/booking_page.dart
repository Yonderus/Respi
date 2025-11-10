import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_container_info.dart';
import 'package:respi/core/widgets/app_menuSports.dart';
import 'package:respi/features/bookings/controllers/BookingController.dart';

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

    // final List<CourtBooking> courtsList =
    //     ref.watch(courtBookingProvider).value ?? [];

    final asyncDatos = ref.watch(
      courtBookingProvider,
    ); // Cogue los datos de todas las pistas

    return Column(
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

        // LISTA DE PISTAS
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: asyncDatos.when(
              data: (courtsList) => ListView.builder(
                itemCount: courtsList.length,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                // El itemBuilder construye cada elemento de la lista, Context son los datos del widget y el index es la posición
                itemBuilder: (context, index) {
                  // Obtenemos la pista en la posición index
                  final pista = courtsList[index];
                  return app_container_info(
                    routeImg: pista.routeImg,
                    text: pista.text,
                    price: pista.price,
                    etiqueta1: pista.etiqueta1,
                    etiqueta2: pista.etiqueta2,
                  );
                },
              ),
              loading: () => Center(
                child: Image.asset('lib/assets/images/animacionCarga.gif'),
              ),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ),
      ],
    );
  }
}
