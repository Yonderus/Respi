import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/Users/providers/current_user_provider.dart';
import 'package:respi/features/bookingADD/controllers/AddBookingController.dart';
import 'package:respi/features/bookingADD/data/repositories/BookingAdd_Repository.dart';
import 'package:respi/providers/booking_repo_provider.dart';

class ProfileStat extends ConsumerWidget {
  const ProfileStat({
    super.key,
    required this.label,
    required this.value,
    required this.color,
    this.contador,
  });

  final String label;
  final String value;
  final Color color;
  final int? contador;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final repo = ref.watch(bookingRepoProvider);
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder(
      future: repo.fetchAll(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Expanded(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final lista = snapshot.data!;
        final email = user?.email;

        // Contar reservas del usuario
        final count = lista.where((r) => r.userEmail == email).length;

        return Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.19),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  count.toString(),
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
