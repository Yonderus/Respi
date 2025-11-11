import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/features/bookings/presentation/pages/booking_page.dart';
import 'package:respi/features/auth/presentation/page/init_page.dart';
import 'package:respi/features/join/presentation/pages/join_page.dart';
import 'package:respi/features/auth/presentation/page/profile_page.dart';
import 'package:respi/providers/bottom_nav_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final selectedIndex = ref.watch(bottomNavIndexProvider);

    final pages = const [InitPage(), BookingPage(), JoinPage(), ProfilePage()];

    final appBarText = [
      l10n.welcomeRespi,
      l10n.reservations,
      l10n.joinParty,
      l10n.profile,
    ];

    return Scaffold(
      appBar: AppBarWidget(texto: appBarText[selectedIndex]),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) =>
            ref.read(bottomNavIndexProvider.notifier).state = index,
        backgroundColor: cs.surface,
        selectedItemColor: cs.primary,
        unselectedItemColor: cs.onSurface.withValues(alpha: 0.7),
        iconSize: 30,
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
      ),
    );
  }
}

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});
  
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }

 
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   static const List<Widget> _widgetOptions = <Widget>[
//     InitPage(),
//     BookingPage(),
//     JoinPage(),
//     ProfilePage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;
//     final theme = Theme.of(context);
//     final cs = theme.colorScheme;
//     final selectedIndex = ref.watch(bottomNavIndexProvider);

//     // Textos del AppBar segun la pantalla seleccionada
//     List<String> appBarText = <String>[
//       l10n.welcomeRespi,
//       l10n.reservations,
//       l10n.joinParty,
//       l10n.profile,
//     ];

//     return Scaffold(
//       appBar: AppBarWidget(
//         texto: appBarText.elementAt(_selectedIndex),
//         // ignore: unrelated_type_equality_checks
//         flecha: _selectedIndex == PreferencesPage,
//       ),

//       // Cuerpo principal
//       body: Center(child: _widgetOptions.elementAt(_selectedIndex)),

//       // Barra inferior
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: cs.surface,
//         iconSize: 30,
//         selectedItemColor: cs.primary,
//         unselectedItemColor: cs.onSurface.withValues(alpha: 0.7),
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.home),
//             label: l10n.home,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.calendar_today),
//             label: l10n.reservations,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.group),
//             label: l10n.joinParty,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.person),
//             label: l10n.profile,
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
