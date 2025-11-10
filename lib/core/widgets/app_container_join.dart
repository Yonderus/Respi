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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SizedBox(
      width: 400,
      height: 240,
      child: Card(
        color: colorScheme.surface,
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
                  context,
                  "Faltan $personasNecesarias persona${personasNecesarias == 1 ? '' : 's'}",
                ),
              ),
            if (level != null)
              Positioned(top: 10, right: 10, child: buildTag(context, level!)),

            // Contenedor inferior
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.surface.withValues(alpha: 0.95),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Línea de información
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text,
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          "$pricePerson€\n/persona",
                          textAlign: TextAlign.right,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Botón Unirse
                    Center(child: AppButton(text: "Unirse")),
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
