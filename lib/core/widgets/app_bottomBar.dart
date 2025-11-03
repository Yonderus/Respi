import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/auth/presentation/page/booking_page.dart';
import 'package:respi/features/auth/presentation/page/home_page.dart';
import 'package:respi/features/auth/presentation/page/profile_page.dart';
import 'package:respi/providers/bottom_nav_provider.dart';

class AppBottombar extends ConsumerWidget {
  const AppBottombar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escucha el valor actual del índice
    final indiceActual = ref.watch(bottomNavIndexProvider);

    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 86, 85, 85),
      currentIndex: indiceActual,
      onTap: (index) {
        // Actualiza el índice en el provider
        ref.read(bottomNavIndexProvider.notifier).state = index;
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookingPage()),
          );
        }
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        }
      },

      iconSize: 30,
      unselectedItemColor: Colors.white,
      selectedItemColor: const Color(0xFFDDF864),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Reservas',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
    );
  }
}
