import 'dart:math';

import 'package:flutter/material.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/features/bookings/presentation/pages/booking_page.dart';
import 'package:respi/features/auth/presentation/page/init_page.dart';
import 'package:respi/features/join/presentation/pages/join_page.dart';
import 'package:respi/features/auth/presentation/page/profile_page.dart';

//import 'package:respi/providers/bottom_nav_provider.dart';

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
    List<String> appBarText = <String>[
      l10n.welcomeRespi,
      l10n.reservations,
      'Unirse',
      l10n.profile,
    ];

    return Scaffold(
      appBar: AppBarWidget(
        texto: appBarText.elementAt(_selectedIndex),
        // flecha: _selectedIndex != 0,
      ),

      //bottomNavigationBar: AppBottombar(),
      // body: InitPage(),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 89, 89, 89),
        iconSize: 30,
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0xFFDDF864),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Reservas',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Unirse'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
