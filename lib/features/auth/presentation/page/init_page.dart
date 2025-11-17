// import 'package:flutter/material.dart';
// import 'package:respi/core/l10n/app_localizations.dart';
// import 'package:respi/core/widgets/app_button_access.dart';
// import 'package:respi/core/widgets/app_container_booking.dart';
// import 'package:respi/core/widgets/app_container_review.dart';
// import 'package:respi/features/bookings/presentation/pages/booking_page.dart';

// class InitPage extends StatelessWidget {
//   const InitPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;
//     final theme = Theme.of(context);
//     final cs = theme.colorScheme;

//     return Container(
//       decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             // TEXTO DE ACCESO RÁPIDO
//             Container(
//               margin: const EdgeInsets.only(left: 40, top: 20),
//               alignment: Alignment.topLeft,
//               child: Text(
//                 l10n.fastAcces,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   color: cs.onSurface,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),

//             // BOTONES DE ACCESO RAPIDO
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 2.0,
//                 vertical: 2.0,
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: AppButtonAccess(
//                         text: l10n.newReservation,
//                         icon: Icons.calendar_today,
//                         function: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const BookingPage(),
//                             ),
//                           );
//                         },
//                         izquierda: false,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: AppButtonAccess(
//                         text: l10n.joinin,
//                         icon: Icons.visibility,
//                         function: () {},
//                         izquierda: true,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // TEXTO DE PROXIMAS RESERVAS
//             Container(
//               margin: const EdgeInsets.only(left: 40, top: 20),
//               alignment: Alignment.topLeft,
//               child: Text(
//                 l10n.upcomingReservations,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   color: cs.onSurface,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),

//             Column(
//               children: [
//                 const Padding(padding: EdgeInsets.all(10)),
//                 app_container_booking(
//                   route: 'lib/assets/images/basketball-ball-variant.png',
//                   sport: l10n.basketball,
//                   data: '27/10/2025',
//                   time: '18:30',
//                   locate: 'Bocairent',
//                 ),
//                 const Padding(padding: EdgeInsets.all(10)),
//                 app_container_booking(
//                   route: 'lib/assets/images/football.png',
//                   sport: l10n.football,
//                   data: '27/10/2025',
//                   time: '18:30',
//                   locate: 'Bocairent',
//                 ),
//                 const Padding(padding: EdgeInsets.all(10)),
//                 app_container_booking(
//                   route: 'lib/assets/images/raqueta-de-padel.png',
//                   sport: l10n.padel,
//                   data: '27/10/2025',
//                   time: '18:30',
//                   locate: 'Bocairent',
//                 ),
//               ],
//             ),

//             // RESEÑAS DE RESERVAS REALIZADAS
//             Container(
//               margin: const EdgeInsets.only(left: 40, top: 20),
//               alignment: Alignment.topLeft,
//               child: Text(
//                 'Reseñas de Reservas',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   color: cs.onSurface,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),

//             Column(
//               children: [
//                 const Padding(padding: EdgeInsets.all(10)),
//                 app_container_review(
//                   route: 'lib/assets/images/tennis.png',
//                   sport: 'Tenis',
//                   locate: 'Pista 12',
//                   stars: 4,
//                 ),
//                 const Padding(padding: EdgeInsets.all(10)),
//                 app_container_review(
//                   route: 'lib/assets/images/basketball-ball-variant.png',
//                   sport: 'Baloncesto',
//                   locate: 'Cancha 3',
//                   stars: 5,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_button_access.dart';
import 'package:respi/core/widgets/app_container_booking.dart';
import 'package:respi/core/widgets/app_container_bookingAdd.dart';
import 'package:respi/core/widgets/app_container_review.dart';
import 'package:respi/providers/bottom_nav_provider.dart';

class InitPage extends ConsumerWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

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
                const SizedBox(height: 10),
                const AppContainerBookingAdd(),
                const SizedBox(height: 10),
                app_container_booking(
                  route: 'lib/assets/images/basketball-ball-variant.png',
                  sport: l10n.basketball,
                  data: '27/10/2025',
                  time: '18:30',
                  locate: 'Bocairent',
                ),
                const SizedBox(height: 10),
                app_container_booking(
                  route: 'lib/assets/images/football.png',
                  sport: l10n.football,
                  data: '27/10/2025',
                  time: '18:30',
                  locate: 'Bocairent',
                ),
                const SizedBox(height: 10),
                app_container_booking(
                  route: 'lib/assets/images/raqueta-de-padel.png',
                  sport: l10n.padel,
                  data: '27/10/2025',
                  time: '18:30',
                  locate: 'Bocairent',
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
