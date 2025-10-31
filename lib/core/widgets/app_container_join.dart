import 'package:flutter/material.dart';
import 'package:respi/core/widgets/app_button.dart';
import 'package:respi/core/widgets/buildTag.dart';

// ignore: camel_case_types
class app_container_join extends StatelessWidget {
  final int? personasNecesarias;
  final String text;
  final double pricePerson;
  final String? level;
  final String routeImage;

  const app_container_join({
    super.key,
    this.personasNecesarias,
    required this.text,
    required this.pricePerson,
    this.level,
    required this.routeImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 240,
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Fondo con imagen
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(routeImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Etiquetas arriba de la imagen
            if (personasNecesarias != null)
              Positioned(
                top: 10,
                left: 10,
                child: buildTag(
                  "Faltan $personasNecesarias persona",
                  backgroundColor: const Color(0xFFDDF864),
                ),
              ),
            if (level != null)
              Positioned(
                top: 10,
                right: 10,
                child: buildTag(level!, backgroundColor: Colors.grey.shade300),
              ),

            // Contenedor blanco en la parte inferior
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                // height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),

                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      //Linea de Informacion
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),

                        Text(
                          "$pricePerson€\n/persona",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 125, 125, 125),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Boton reservar
                    AppButton(text: "Unirse"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
