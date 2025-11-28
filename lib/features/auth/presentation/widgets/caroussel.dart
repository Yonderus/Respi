import 'dart:async';
import 'package:flutter/material.dart';
import 'package:respi/features/auth/presentation/widgets/caroussel_card.dart';

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
      CarousselCard(
        title: "Reserva tus pistas al momento",
        subText: "Encuentra disponibilidad y juega cuando quieras",
        image: "lib/assets/images/Personas_padel.png",
      ),
      CarousselCard(
        title: "Únete a partidos cerca de ti",
        subText: "Descubre jugadores y forma equipos fácilmente",
        image: "lib/assets/images/personas_unirse.png",
      ),
      CarousselCard(
        title: "Gestiona tus reservas en un toque",
        subText: "Historial, próximos partidos y recordatorios",
        image: "lib/assets/images/gestionar_carusel.png",
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
