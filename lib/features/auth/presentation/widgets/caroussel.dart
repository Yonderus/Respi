import 'dart:async';
import 'package:flutter/material.dart';

class SwipeCard extends StatefulWidget {
  const SwipeCard({super.key});

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  final PageController _controller = PageController();
  late Timer timer;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!_controller.hasClients) return;

      currentPage++;

      if (currentPage >= 4) {
        currentPage = 0;
      }

      _controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final List<Widget> cards = [
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [cs.primary, Colors.white],
            ),
          ),
          child: const Center(
            child: Text("Card 1", style: TextStyle(fontSize: 24)),
          ),
        ),
      ),

      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [cs.primary, Colors.white],
            ),
          ),
          child: const Center(
            child: Text("Card 2", style: TextStyle(fontSize: 24)),
          ),
        ),
      ),
      Card(
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
      ),
    ];

    final width = MediaQuery.of(context).size.width;
    final height = width * 0.47;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: height,
        width: width,
        child: PageView.builder(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: cards[index],
            );
          },
        ),
      ),
    );
  }
}
