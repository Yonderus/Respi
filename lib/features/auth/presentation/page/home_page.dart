import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/features/bookingADD/presentation/pages/addBooking_page.dart';
import 'package:respi/features/bookings/presentation/pages/booking_page.dart';
import 'package:respi/features/auth/presentation/page/init_page.dart';
import 'package:respi/features/join/presentation/pages/join_page.dart';
import 'package:respi/features/auth/presentation/page/profile_page.dart';
import 'package:respi/providers/bottom_nav_provider.dart';
import 'package:respi/providers/pages_nav_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final selectedIndex = ref.watch(bottomNavIndexProvider);
    final selectedPage = ref.watch(pagesNavProvider);

    final pages = const [
      InitPage(),
      BookingPage(),
      JoinPage(),
      ProfilePage(),
      AddbookingPage(),
    ];

    final appBarText = [
      l10n.welcomeRespi,
      l10n.reservations,
      l10n.joinParty,
      l10n.profile,
      "Nueva Reserva",
    ];

    return Scaffold(
      appBar: AppBarWidget(texto: appBarText[selectedIndex]),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
          ref.read(pagesNavProvider.notifier).state = index;
        },
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
