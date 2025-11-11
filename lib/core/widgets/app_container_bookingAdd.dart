import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:respi/providers/bottom_nav_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppContainerBookingAdd extends ConsumerWidget {
  const AppContainerBookingAdd({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final screenWidth =
        MediaQuery.of(context).size.width - 30; // Ajuste de padding

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: SizedBox(
        width: screenWidth,
        height: 60,
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            strokeWidth: 5,
            dashPattern: const [45, 15],
            radius: const Radius.circular(15),
            color: cs.primary,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              // Acción al pulsar el contenedor
              ref.read(bottomNavIndexProvider.notifier).state = 1;
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Icon(Icons.add_circle, color: cs.onSecondary, size: 40),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
