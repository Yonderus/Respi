import 'package:flutter/material.dart';

class CarousselCard extends StatelessWidget {
  const CarousselCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            // ==========================
            //   TEXTO IZQUIERDA
            // ==========================
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bienvenido a ResPi",
                  style: TextStyle(
                    color: cs.onTertiary,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Reserva pistas deportivas y\núnete a partidos",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),

            // ==========================
            //   IMÁGENES SUPERPUESTAS
            // ==========================
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                width: 150,
                height: 150,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Raqueta atrás
                    Positioned(
                      top: -10,
                      right: -5,
                      child: Image.asset(
                        "lib/assets/images/raqueta-de-padel.png",
                        height: 110,
                      ),
                    ),

                    // Pelota futbol
                    Positioned(
                      top: 92,
                      right: 55,
                      child: Image.asset(
                        "lib/assets/images/football.png",
                        height: 45,
                      ),
                    ),

                    // Balón basket adelante
                    Positioned(
                      top: 60,
                      right: -10,
                      child: Image.asset(
                        "lib/assets/images/basketball-ball-variant.png",
                        height: 70,
                      ),
                    ),
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
