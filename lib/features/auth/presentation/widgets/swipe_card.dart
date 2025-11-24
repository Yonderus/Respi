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

  final List<String> images = [
    'lib/assets/images/slideImg1.png',
    'lib/assets/images/fondo-basket.png',
    'lib/assets/images/slideImg2.png',
  ];

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!_controller.hasClients) return;

      currentPage++;

      if (currentPage >= images.length) {
        currentPage = 0; // reinicia
      }

      _controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic, //el tipo de swipe que hace
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
    final width = MediaQuery.of(context).size.width;
    final height = width * 0.47;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: height,
        width: width,

        //pageview para poder poner elementos uno al lado de otro y poner animaciones(swipe)
        child: PageView.builder(
          controller: _controller,

          physics:
              const NeverScrollableScrollPhysics(), //para q el usuario no pueda tocar el carusel
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(images[index], fit: BoxFit.fill),
            );
          },
        ),
      ),
    );
  }
}
