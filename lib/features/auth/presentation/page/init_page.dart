import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_button_access.dart';
import 'package:respi/core/widgets/app_container_booking.dart';
import 'package:respi/core/widgets/app_container_bookingAdd.dart';
import 'package:respi/core/widgets/app_container_review.dart';
import 'package:respi/providers/bottom_nav_provider.dart';
import 'package:respi/features/bookingADD/controllers/AddBookingController.dart';

class InitPage extends ConsumerWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final bookingAddAsync = ref.watch(bookingAddProvider);

    return Container(
      decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- TEXTO DE ACCESO RÁPIDO ---
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
                          // Cambia la pestaña activa del BottomNavigationBar
                          ref.read(bottomNavIndexProvider.notifier).state = 1;
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
                          // Cambia a la pestaña de "Unirse"
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
                    if (reservas.isEmpty) {
                      return Center(child: AppContainerBookingAdd());
                    } else {
                      return Column(
                        children: reservas.map((reserva) {
                          // Elegir la imagen según el deporte
                          String imagePath;
                          switch (reserva.sport.toLowerCase()) {
                            case 'basket':
                              imagePath =
                                  'lib/assets/images/basketball-ball-variant.png';
                              break;
                            case 'futbol':
                              imagePath = 'lib/assets/images/football.png';
                              break;
                            case 'pádel':
                              imagePath =
                                  'lib/assets/images/raqueta-de-padel.png';
                              break;
                            case 'tenis':
                              imagePath =
                                  'lib/assets/images/pelota-de-tenis.png';
                              break;
                            case 'voley':
                              imagePath = 'lib/assets/images/juego.png';
                              break;
                            default:
                              imagePath = 'lib/assets/images/default-sport.png';
                          }

                          return Column(
                            children: [
                              app_container_booking(
                                route: imagePath,
                                sport: reserva.sport,
                                data: reserva.day,
                                time: reserva.timeIni,
                                locate: reserva.location,
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        }).toList(),
                      );
                    }
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
