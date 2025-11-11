import 'package:flutter/material.dart';

// ignore: camel_case_types
class app_container_booking extends StatelessWidget {
  final String route;
  final String sport;
  final String data;
  final String time;
  final String locate;

  const app_container_booking({
    super.key,
    required this.route,
    required this.sport,
    required this.data,
    required this.time,
    required this.locate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final screenWidth = MediaQuery.of(context).size.width; // Ajuste de padding

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: SizedBox(
        width: screenWidth, // ocupa todo el ancho disponible
        height: 100, //height lo dejamos igual
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
              // Icono o imagen del deporte
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: cs.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    route,
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(width: 20),

              // Información del deporte
              Expanded(
                // hace que el contenido se ajuste al ancho q queda
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sport,
                      style: TextStyle(
                        fontSize: 18,
                        color: cs.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow:
                          TextOverflow.ellipsis, // el overflow evita q desporde
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      // deja que el texto salte de linea si no cabe
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      runSpacing: 4,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 14,
                              color: cs.onSurface.withValues(alpha: 0.7),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              data,
                              style: TextStyle(
                                color: cs.onSurface.withValues(alpha: 0.7),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: cs.onSurface.withValues(alpha: 0.7),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              time,
                              style: TextStyle(
                                color: cs.onSurface.withValues(alpha: 0.7),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 14,
                              color: cs.onSurface.withValues(alpha: 0.7),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              locate,
                              style: TextStyle(
                                color: cs.onSurface.withValues(alpha: 0.7),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
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
