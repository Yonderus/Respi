import 'package:flutter/material.dart';
import 'package:respi/app/theme/app_colors.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/widgets/app_container_booking.dart';
import 'package:respi/core/widgets/app_container_info.dart';
import 'package:respi/core/widgets/app_container_join.dart';
import 'package:respi/core/widgets/app_container_review.dart';

class DemoContainment extends StatelessWidget {
  const DemoContainment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(texto: "Contenedores"),

      body: Container(
        decoration: BoxDecoration(color: backgroundColor),

        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Primer contenedor
                SizedBox(height: 35),
                app_container_booking(
                  route: "lib/assets/images/basketball.png",
                  sport: "Baloncesto",
                  data: "20/10/2025",
                  time: "12:00",
                  locate: "Pista 12",
                ),

                //Segundo contenedor
                SizedBox(height: 35),
                app_container_info(
                  routeImg: 'lib/assets/images/fondo-basket.png',
                  text: 'Cancha de Baloncesto',
                  price: '27',
                ),

                //Tercer Contenedor
                SizedBox(height: 35),
                app_container_join(
                  personasNecesarias: 3,
                  text: 'Pista de Padel',
                  pricePerson: 4,
                  level: 'Intermedio',
                  routeImage: 'lib/assets/images/fondo-padel.png',
                ),

                //Cuarto Contenedor
                SizedBox(height: 35),
                app_container_review(
                  route: "lib/assets/images/tennis.png",
                  sport: "Tenis",
                  locate: "Pista 5",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
