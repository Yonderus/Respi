import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/bookings/controllers/BookingController.dart';

class AppMenusports extends ConsumerStatefulWidget {
  const AppMenusports({super.key});

  @override
  ConsumerState<AppMenusports> createState() => _AppMenusportsState();
}

class _AppMenusportsState extends ConsumerState<AppMenusports> {
  String _selectedSport = 'Todos';

  @override
  Widget build(BuildContext context) {
    Widget buildFilterButton(String text, IconData icon) {
      final isSelected = _selectedSport == text;
      return Container(
        margin: const EdgeInsets.only(right: 14),
        child: ElevatedButton.icon(
          onPressed: () {
            // Actualizamos el provider
            setState(() {
              _selectedSport = text;
            });

            ref
                .read(
                  courtBookingProvider.notifier,
                ) // Leemos los datos del notifier
                .filterBySport(
                  _selectedSport,
                ); // Filtramos por el deporte seleccionado
          },
          icon: Icon(icon, color: isSelected ? Colors.black : Colors.grey[800]),
          label: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey[800],
              fontWeight: FontWeight.w600,
            ),
          ),
          // Selecionamos el color del botón según si está seleccionado o no
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected
                ? const Color(0xFFDDF864)
                : const Color(0xFFBDBDBD),
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
