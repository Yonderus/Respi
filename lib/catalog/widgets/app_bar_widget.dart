import 'package:flutter/material.dart';
import 'package:respi/features/preferences/presentation/pages/preferences_page.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String texto;

  const AppBarWidget({super.key, required this.texto});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        onPressed: () => Navigator.maybePop(context),
      ),

      //Icono de ajustes en el appbar
      actions: [
        IconButton(
          icon: Icon(
            Icons.settings,
            color: const Color.fromARGB(255, 172, 172, 172),
          ),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PreferencesPage()),
            );
          },
        ),
      ],

      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 192, 192, 192), // color izquierdo
              Color(0xFF2E2E2E), // color derecho (más oscuro o claro)
            ],
          ),
        ),
      ),

      title: Text(texto),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
