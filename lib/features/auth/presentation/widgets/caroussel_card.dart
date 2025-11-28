import 'package:flutter/material.dart';
import 'package:respi/core/theme/app_colors.dart';

class CarousselCard extends StatelessWidget {
  final String title;
  final String subText;
  final String image;

  const CarousselCard({
    super.key,
    required this.title,
    required this.subText,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final title = this.title;
    final subText = this.subText;
    final image = this.image;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover, // La imagen ocupa todo
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.3),
              BlendMode.darken,
            ),
          ),
        ),
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
                  title,
                  style: TextStyle(
                    color: cs.onTertiary,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  subText,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
