import 'package:flutter/material.dart';
import 'package:respi/core/theme/app_colors.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/widgets/app_container_booking.dart';
import 'package:respi/core/widgets/app_container_info.dart';
import 'package:respi/core/widgets/app_container_join.dart';
import 'package:respi/core/widgets/app_container_review.dart';
import 'package:respi/features/bookings/data/models/CourtBooking.dart';

class DemoContainment extends StatelessWidget {
  const DemoContainment({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the current theme
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBarWidget(texto: "Contenedores", flecha: true),

      body: Container(
        color: theme.scaffoldBackgroundColor,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: Column(
              children: [
                app_container_booking(
                  route: "lib/assets/images/basketball.png",
                  sport: "Baloncesto",
                  data: "20/10/2025",
                  timeIni: "12:00",
                  timeFin: "13:00",
                  locate: "Pista 12",
                ),

                const SizedBox(height: 35),

                app_container_info(
                  pista: CourtBooking(
                    text: 'Tenis',
                    sport: 'Tenis',
                    routeImg: 'lib/assets/images/tennis.png',
                    price: '15',
                    etiqueta1: 'Arcilla',
                    etiqueta2: 'Exterior',
                    location: 'Pista Exterior, Centro Deportivo Respi',
                    capacity: '4 personas',
                    caracteristics1: 'Superficie de arcilla profesional',
                    caracteristics2: 'Red de alta resistencia',
                    caracteristics3: '',
                    caracteristics4: '',
                    description:
                        'Pista de tenis con superficie de arcilla profesional y red de alta resistencia.',
                  ),
                ),

                const SizedBox(height: 35),

                app_container_join(
                  personasNecesarias: 3,
                  text: 'Pista de Padel',
                  pricePerson: 4,
                  level: 'Intermedio',
                  routeImage: 'lib/assets/images/fondo-padel.png',
                ),

                const SizedBox(height: 35),

                app_container_review(
                  route: "lib/assets/images/tennis.png",
                  sport: "Tenis",
                  locate: "Pista 5",
                  stars: 4,
                ),

                const SizedBox(height: 50),

                Container(
                  decoration: BoxDecoration(
                    gradient: isDark
                        ? AppColorsDark.gradientLeftToRight
                        : AppColorsLight.gradientLeftToRight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'New Reservation',
                      style: TextStyle(
                        color: isDark
                            ? AppColorsDark.textPrimary
                            : AppColorsLight.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
