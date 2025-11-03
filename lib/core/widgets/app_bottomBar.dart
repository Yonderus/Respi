import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/theme/app_colors.dart';
import 'package:respi/features/preferences/presentation/providers/preferences_provider.dart';

class AppBottombar extends ConsumerStatefulWidget {
  const AppBottombar({super.key});

  @override
  AppBottombarState createState() => AppBottombarState();
}

class AppBottombarState extends ConsumerState<AppBottombar> {
  int Indice_Actual = 0; // Índice de la pestaña seleccionada

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: l10n.home /*'Inicio'*/,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: l10n.reservations /*'Reservas'*/,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: l10n.profile /*'Perfil'*/,
        ),
      ],
    );
  }
}
