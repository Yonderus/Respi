import 'package:flutter/material.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/features/auth/presentation/page/booking_page.dart';
import 'package:respi/features/auth/presentation/page/init_page.dart';
import 'package:respi/features/auth/presentation/page/profile_page.dart';
//import 'package:respi/providers/bottom_nav_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    InitPage(),
    BookingPage(),
    ProfilePage(),
  ];

  static const List<String> _appBarText = <String>[
    "Inicio",
    "Booking",
    "Perfil",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBarWidget(
        texto: _appBarText.elementAt(_selectedIndex),
        flecha: false,
      ),

      //bottomNavigationBar: AppBottombar(),
      // body: InitPage(),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Reservas',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
