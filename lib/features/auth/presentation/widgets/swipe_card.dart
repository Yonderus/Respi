import 'package:flutter/material.dart';

class SwipeCard extends StatelessWidget {
  const SwipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior:
          Clip.antiAlias, // importante para que respete los bordes redondeados
      child: Image.asset('tennis.png', fit: BoxFit.cover),
    );
  }
}
