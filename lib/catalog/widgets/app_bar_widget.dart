import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/preferences/presentation/pages/preferences_page.dart';
import 'package:respi/providers/bottom_nav_provider.dart';

class AppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  final String texto;

  const AppBarWidget({super.key, required this.texto});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        onPressed: () {
          ref.read(bottomNavIndexProvider.notifier).state = 0;
          Navigator.maybePop(context);
        },
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
