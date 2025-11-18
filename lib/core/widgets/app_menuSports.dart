import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/features/bookings/controllers/BookingController.dart';
import 'package:respi/providers/menuSport_provaider.dart';

class AppMenusports extends ConsumerStatefulWidget {
  const AppMenusports({super.key});

  @override
  ConsumerState<AppMenusports> createState() => _AppMenusportsState();
}

class _AppMenusportsState extends ConsumerState<AppMenusports> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final selectedSport = ref.watch(selectedSportProvider);

    Widget buildFilterButton(
      String internalValue,
      String translatedText,
      IconData icon,
    ) {
      final isSelected = selectedSport == internalValue;

      return Container(
        margin: const EdgeInsets.only(right: 14),
        child: ElevatedButton.icon(
          onPressed: () {
            setState(() {
              ref.read(selectedSportProvider.notifier).state = internalValue;
            });

            ref
                .read(courtBookingProvider.notifier)
                .filterBySport(internalValue);
          },
          icon: Icon(
            icon,
            color: isSelected ? cs.onPrimary : cs.onInverseSurface,
          ),
          label: Text(
            translatedText,
            style: TextStyle(
              color: isSelected ? cs.onPrimary : cs.onInverseSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? cs.primary : cs.inverseSurface,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          buildFilterButton("Todos", t.filter_all, Icons.sports),
          buildFilterButton("Basket", t.filter_basket, Icons.sports_basketball),
          buildFilterButton("Futbol", t.filter_futbol, Icons.sports_soccer),
          buildFilterButton("Tenis", t.filter_tennis, Icons.sports_tennis),
          buildFilterButton(
            "Pádel",
            t.filter_padel,
            Icons.sports_tennis_outlined,
          ),
        ],
      ),
    );
  }
}
