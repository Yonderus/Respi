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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SizedBox(
      width: 400,
      height: 250,
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
                  image: AssetImage(routeImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),

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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          "$price€\n/hora",
                          textAlign: TextAlign.right,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Etiquetas LED y Cristal
                    Row(
                      children: [
                        buildTag(context, etiqueta1),
                        const SizedBox(width: 8),
                        buildTag(context, etiqueta2),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Boton reservar
                    Center(child: AppButton(text: "Reservar")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reservar Pista'),
          content: const Text('Funcionalidad de reserva en desarrollo.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
