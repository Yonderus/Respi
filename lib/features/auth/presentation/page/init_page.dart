import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_button_access.dart';
import 'package:respi/core/widgets/app_container_review.dart';
import 'package:respi/core/widgets/listarReservas.dart';
import 'package:respi/features/Users/providers/auth_providers.dart';
import 'package:respi/features/bookings/presentation/pages/booking_page.dart';
import 'package:respi/features/auth/presentation/widgets/swipe_card.dart';
import 'package:respi/providers/bottom_nav_provider.dart';
import 'package:respi/features/bookingADD/controllers/AddBookingController.dart';

class InitPage extends ConsumerWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    // Usuario logueado
    final user = ref.watch(currentUserProvider);
    final String? userEmail = user?.email;

    // Reservas añadidas (provider)
    final bookingAddAsync = ref.watch(bookingAddProvider);

    return Container(
      decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            // --- TEXTO DE ACCESO RÁPIDO ---
            SwipeCard(),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Text(
                l10n.fastAcces,
                style: TextStyle(
                  color: cs.onSurface,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // --- BOTONES DE ACCESO RÁPIDO ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AppButtonAccess(
                        text: l10n.newReservation,
                        icon: Icons.calendar_today,
                        izquierda: false,
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AppButtonAccess(
                        text: l10n.joinin,
                        icon: Icons.visibility,
                        izquierda: true,
                        function: () {
                          ref.read(bottomNavIndexProvider.notifier).state = 2;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // --- TEXTO DE PRÓXIMAS RESERVAS ---
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Text(
                l10n.upcomingReservations,
                style: TextStyle(
                  color: cs.onSurface,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // --- TARJETAS DE PRÓXIMAS RESERVAS ---
            Column(
              children: [
                bookingAddAsync.when(
                  data: (reservas) {
                    if (userEmail == null) {
                      return const Center(
                        child: Text("No hay usuario logueado"),
                      );
                    }

                    // Filtrar SOLO reservas del usuario logueado
                    final userReservas = reservas
                        .where(
                          (r) =>
                              r.userEmail.toLowerCase() ==
                              userEmail.toLowerCase(),
                        )
                        .toList();

                    // Función para obtener DateTime de la reserva
                    DateTime parseReservaDate(String day, String time) {
                      final date = DateTime.parse(day);
                      final parts = time.split(':');
                      return DateTime(
                        date.year,
                        date.month,
                        date.day,
                        // Hora de inicio
                        int.parse(parts[0]),
                        // Minuto de inicio
                        int.parse(parts[1]),
                      );
                    }

                    final now = DateTime.now();

                    // PRÓXIMAS RESERVAS
                    // Aqui realizamos el filtrado de las reservas dependiendo
                    // si son futuras o pasadas
                    final reservasProximas = userReservas.where((r) {
                      final fecha = parseReservaDate(r.day, r.timeIni);
                      return fecha.isAfter(now);
                    }).toList();

                    if (reservasProximas.isEmpty) {
                      return const Center(
                        child: Text(
                          "No hay reservas próximas",
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }

                    return listarReservas(reservasProximas, ref, true);
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('Error: $err')),
                ),
              ],
            ),

            // --- TEXTO DE RESEÑAS ---
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Text(
                l10n.reservationReviews,
                style: TextStyle(
                  color: cs.onSurface,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // --- TARJETAS DE RESEÑAS ---
            Column(
              children: [
                const SizedBox(height: 10),
                app_container_review(
                  route: 'lib/assets/images/tennis.png',
                  sport: l10n.tennis,
                  locate: '${l10n.tennisCourt} 12',
                  stars: 4,
                ),
                const SizedBox(height: 10),
                app_container_review(
                  route: 'lib/assets/images/basketball-ball-variant.png',
                  sport: l10n.basketball,
                  locate: '${l10n.basketBallCourt} 3',
                  stars: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
