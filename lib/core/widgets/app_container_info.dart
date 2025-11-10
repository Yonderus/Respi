import 'package:flutter/material.dart';
import 'package:respi/core/widgets/app_button.dart';
import 'buildTag.dart';

// ignore: camel_case_types
class app_container_info extends StatelessWidget {
  final String routeImg;
  final String text;
  final String price;
  final String etiqueta1;
  final String etiqueta2;

  const app_container_info({
    super.key,
    required this.routeImg,
    required this.text,
    required this.price,
    required this.etiqueta1,
    required this.etiqueta2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 250,
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Fondo con imagen
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(routeImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Contenedor blanco en la parte inferior
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                // height: 130,
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
                          "$price€\n/hora",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 125, 125, 125),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Etiquetas LED y Cristal
                    Row(
                      children: [
                        buildTag(
                          etiqueta1,
                          backgroundColor: Colors.grey.shade300,
                        ),
                        const SizedBox(width: 8),
                        buildTag(
                          etiqueta2,
                          backgroundColor: Colors.grey.shade300,
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Boton reservar
                    Center(child: AppButton(text: "Reservas")),
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
