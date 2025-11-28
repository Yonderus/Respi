import 'package:flutter/material.dart';

// ignore: camel_case_types
class app_container_review extends StatelessWidget {
  final String route;
  final String sport;
  final String locate;
  final int stars;

  const app_container_review({
    super.key,
    required this.route,
    required this.sport,
    required this.locate,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final screenWidth = MediaQuery.of(
      context,
    ).size.width; // ancho del dispositivo

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: SizedBox(
        width: screenWidth, // ocupa todo el ancho del dispositivo
        height: 100,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: cs.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(12),
            elevation: 1,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagen del deporte
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [cs.primary, cs.onTertiary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(route, fit: BoxFit.contain),
                ),
              ),

              const SizedBox(width: 20),

              // texto e informacion
              Expanded(
                // se adapta al espacio restante
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nombre del deporte
                    Text(
                      sport,
                      style: TextStyle(
                        fontSize: 18,
                        color: cs.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis, // evita desbordes
                    ),

                    const SizedBox(height: 4),

                    // Localizacion
                    Text(
                      locate,
                      style: TextStyle(
                        fontSize: 14,
                        color: cs.onSurface.withValues(alpha: 0.7),
                      ),
                      overflow: TextOverflow.ellipsis, // evita texto largo
                    ),

                    const SizedBox(height: 6),

                    // Estrellas
                    Wrap(
                      // se adapta si el espacio es pequeño
                      spacing: 4,
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < stars ? Icons.star : Icons.star_border,
                          size: 18,
                          color: cs.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
