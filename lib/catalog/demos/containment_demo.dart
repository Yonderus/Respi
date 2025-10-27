import 'package:flutter/material.dart';
import 'package:respi/app/theme/app_colors.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/widgets/app_container_booking.dart';
import 'package:respi/core/widgets/app_container_info.dart';

class DemoContainment extends StatelessWidget {
  const DemoContainment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(texto: "Contenedores"),

      body: Container(
        decoration: BoxDecoration(color: backgroundColor),

        child: Center(
          //child: SingleChildScrollView(
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
              app_container_info(),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
