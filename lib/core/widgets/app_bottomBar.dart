import 'package:flutter/material.dart';
import 'package:respi/app/theme/app_colors.dart';

class AppBottombar extends StatefulWidget {
  const AppBottombar({super.key});

  @override
  AppBottombarState createState() => AppBottombarState();
}

class AppBottombarState extends State<AppBottombar> {
  int Indice_Actual = 0; // Índice de la pestaña seleccionada

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 86, 85, 85),
      currentIndex: Indice_Actual,
      onTap: (index) {
        setState(() {
          Indice_Actual = index;
        });
      },
      iconSize: 30,
      unselectedItemColor: Colors.white,
      selectedItemColor: const Color(0xFFDDF864),
      items: [
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
