import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_container_bookingAdd.dart';
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
    final cs = Theme.of(context).colorScheme;

    final asyncDatos = ref.watch(courtBookingProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // MENÚ DE DEPORTES
        const AppMenusports(),
        const SizedBox(height: 10),

        // TÍTULO
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '${l10n.selectcamp}:',
              style: TextStyle(
                color: cs.onSurface,
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
                itemBuilder: (context, index) {
                  final pista = courtsList[index];
                  return app_container_info(pista: pista);
                },
              ),
              loading: () => Center(
                child: Image.asset('lib/assets/images/animacionCarga.gif'),
              ),
              error: (err, stack) => Center(
                child: Text('Error: $err', style: TextStyle(color: cs.error)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
