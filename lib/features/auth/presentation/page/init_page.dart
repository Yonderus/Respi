import 'package:flutter/material.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_button_access.dart';
import 'package:respi/core/widgets/app_container_booking.dart';
import 'package:respi/core/widgets/app_container_review.dart';
import 'package:respi/features/auth/presentation/page/booking_page.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 209, 211, 204)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //TEXTO DE ACCESO RAPIDO
            Container(
              margin: const EdgeInsets.only(left: 40, top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  l10n.fastAcces,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            //Botones de ACCESO RAPIDO
            // BOTONES DE ACCESO RÁPIDO (RESPONSIVE)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 2.0,
                vertical: 2.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AppButtonAccess(
                        text: l10n.newReservation,
                        icon: Icons.calendar_today,
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
                        function: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //TEXTO DE PRÓXIMAS RESERVAS
            Container(
              margin: const EdgeInsets.only(left: 40, top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  l10n.upcomingReservations,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Column(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                app_container_booking(
                  route: 'lib/assets/images/basketball-ball-variant.png',
                  sport: l10n.basketball,
                  data: '27/10/2025',
                  time: '18:30',
                  locate: 'Bocairent',
                ),

                Padding(padding: EdgeInsets.all(10)),
                app_container_booking(
                  route: 'lib/assets/images/football.png',
                  sport: l10n.football,
                  data: '27/10/2025',
                  time: '18:30',
                  locate: 'Bocairent',
                ),

                Padding(padding: EdgeInsets.all(10)),
                app_container_booking(
                  route: 'lib/assets/images/raqueta-de-padel.png',
                  sport: l10n.padel,
                  data: '27/10/2025',
                  time: '18:30',
                  locate: 'Bocairent',
                ),
              ],
            ),

            // RESEÑAS DE RESERVAS REALIZADAS
            Container(
              margin: const EdgeInsets.only(left: 40, top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Reseñas de Reservas',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Column(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                app_container_review(
                  route: 'lib/assets/images/tennis.png',
                  sport: 'Tenis',
                  locate: 'Pista 12',
                  stars: 4,
                ),
                Padding(padding: EdgeInsets.all(10)),
                app_container_review(
                  route: 'lib/assets/images/basketball-ball-variant.png',
                  sport: 'Baloncesto',
                  locate: 'Cancha 3',
                  stars: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
