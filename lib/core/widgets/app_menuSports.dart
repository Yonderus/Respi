import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

/// Provider global para el deporte seleccionado
final selectedSportProvider = StateProvider<String>((ref) => 'Todos');

class AppMenusports extends ConsumerWidget {
  const AppMenusports({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedSportProvider); // Deporte seleccionado

    Widget buildFilterButton(String text, IconData icon) {
      final isSelected = selected == text;
      return Container(
        margin: const EdgeInsets.only(right: 14),
        child: ElevatedButton.icon(
          onPressed: () {
            // Actualizamos el provider
            ref.read(selectedSportProvider.notifier).state = text;
          },
          icon: Icon(icon, color: isSelected ? Colors.black : Colors.grey[800]),
          label: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey[800],
              fontWeight: FontWeight.w600,
            ),
          ),
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
