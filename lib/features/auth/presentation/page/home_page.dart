import 'package:flutter/material.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/features/auth/presentation/page/register_page.dart';
import 'package:respi/features/bookings/presentation/pages/booking_page.dart';
import 'package:respi/features/auth/presentation/page/init_page.dart';
import 'package:respi/features/join/presentation/pages/join_page.dart';
import 'package:respi/features/auth/presentation/page/profile_page.dart';
import 'package:respi/features/preferences/presentation/pages/preferences_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    InitPage(),
    BookingPage(),
    JoinPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    // Textos del AppBar segun la pantalla seleccionada
    List<String> appBarText = <String>[
      l10n.welcomeRespi,
      l10n.reservations,
      l10n.joinParty,
      l10n.profile,
    ];

    return Scaffold(
      appBar: AppBarWidget(texto: appBarText.elementAt(_selectedIndex)),

      // Cuerpo principal
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),

      // Barra inferior
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: cs.surface,
        iconSize: 30,
        selectedItemColor: cs.primary,
        unselectedItemColor: cs.onSurface.withValues(alpha: 0.7),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: l10n.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_today),
            label: l10n.reservations,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.group),
            label: l10n.joinParty,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: l10n.profile,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
