import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final selectedSport = StateProvider<String>((ref) => "Todos");

// Widget que muestra un menú horizontal de filtros (deportes)
class AppMenusports extends ConsumerWidget {
  const AppMenusports({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtenemos el deporte seleccionado desde el provider (Riverpod)
    final deporteSeleccionado = ref.watch(selectedSport);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // permite desplazamiento horizontal
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          // Cada botón se construye con la función privada _buildFilterButton
          _buildFilterButton(
            ref,
            "Todos",
            Icons.sports,
            deporteSeleccionado == "Todos", // marca si está seleccionado
          ),
          _buildFilterButton(
            ref,
            "Basket",
            Icons.sports_basketball,
            deporteSeleccionado == "Basket",
          ),
          _buildFilterButton(
            ref,
            "Futbol",
            Icons.sports_soccer,
            deporteSeleccionado == "Futbol",
          ),
          _buildFilterButton(
            ref,
            "Tenis",
            Icons.sports_tennis,
            deporteSeleccionado == "Tenis",
          ),
          _buildFilterButton(
            ref,
            "Pádel",
            Icons.sports_tennis_outlined,
            deporteSeleccionado == "Pádel",
          ),
        ],
      ),
    );
  }

  //Botón personalizado para cada filtro
  Widget _buildFilterButton(
    WidgetRef ref,
    String text,
    IconData icon,
    bool isSelected,
  ) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      child: ElevatedButton.icon(
        onPressed: () {
          // Al pulsar, actualizamos el estado del provider con el texto
          // Usamos read(...).notifier.state = ... para cambiar el valor
          ref.read(selectedSport.notifier).state = text;
        },
        // Icono cuyo color cambia según si está seleccionado
        icon: Icon(icon, color: isSelected ? Colors.black : Colors.grey[800]),
        // Label con estilo, también cambia de color según selección
        label: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey[800],
            fontWeight: FontWeight.w600,
          ),
        ),
        // Estilos del botón
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
}

// ...existing code...
