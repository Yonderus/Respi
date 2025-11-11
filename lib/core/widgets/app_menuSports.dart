import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/bookings/controllers/BookingController.dart';
import 'package:respi/providers/menuSport_provaider.dart';

class AppMenusports extends ConsumerStatefulWidget {
  const AppMenusports({super.key});

  @override
  ConsumerState<AppMenusports> createState() => _AppMenusportsState();
}

class _AppMenusportsState extends ConsumerState<AppMenusports> {
  //String _selectedSport = 'Todos';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final selectedSport = ref.watch(selectedSportProvider);

    Widget buildFilterButton(String text, IconData icon) {
      final isSelected = selectedSport == text;
      return Container(
        margin: const EdgeInsets.only(right: 14),
        child: ElevatedButton.icon(
          onPressed: () {
            // Actualizamos el provider
            setState(() {
              // Leemos el estado actual y lo actualizamos
              ref.read(selectedSportProvider.notifier).state = text;
            });

            ref
                // Leemos los datos del notifier
                .read(courtBookingProvider.notifier)
                .filterBySport(text); // Filtramos por el deporte seleccionado
          },
          icon: Icon(
            icon,
            color: isSelected ? cs.onPrimary : cs.onInverseSurface,
          ),
          label: Text(
            text,
            style: TextStyle(
              color: isSelected ? cs.onPrimary : cs.onInverseSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          // Selecionamos el color del botón según si está seleccionado o no
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? cs.primary : cs.inverseSurface,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          buildFilterButton('Todos', Icons.sports),
          buildFilterButton('Basket', Icons.sports_basketball),
          buildFilterButton('Futbol', Icons.sports_soccer),
          buildFilterButton('Tenis', Icons.sports_tennis),
          buildFilterButton('Pádel', Icons.sports_tennis_outlined),
        ],
      ),
    );
  }
}
