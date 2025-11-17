import 'package:flutter/material.dart';
import 'package:respi/core/widgets/app_button.dart';
import 'package:respi/features/bookings/data/models/CourtBooking.dart';
import 'buildTag.dart';

// ignore: camel_case_types
class app_container_info extends StatelessWidget {
  // final String routeImg;
  // final String text;
  // final String price;
  // final String etiqueta1;
  // final String etiqueta2;
  // final String? location;
  // final String? capacity;
  // final String? caracteristics1;
  // final String? caracteristics2;
  // final String? caracteristics3;
  // final String? caracteristics4;
  // final String? description;
  final CourtBooking pista;

  const app_container_info({super.key, required this.pista});

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
                  image: AssetImage(pista.routeImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Icono encima de la imagen
            Positioned(
              top: 8,
              right: 8,
              // El GestureDetector lo he usado para detectar el toque en el icono
              child: GestureDetector(
                onTap: () => _dialogBuilder(context, pista),
                child: Icon(
                  Icons.info_outline,
                  color: colorScheme.inverseSurface,
                  size: 30,
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
                        Expanded(
                          child: Text(
                            pista.text,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${pista.price}€\n/hora",
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
                        buildTag(context, pista.etiqueta1),
                        const SizedBox(width: 8),
                        buildTag(context, pista.etiqueta2),
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

  Future<void> _dialogBuilder(BuildContext context, CourtBooking pista) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text('Información de Pista'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Imagen de la pista
                Image.asset(pista.routeImg),
                const SizedBox(height: 10),

                // Detalles de la pista
                Text(
                  pista.text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  pista.location,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Capacidad: ${pista.capacity}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  'Características:',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),

                // Lista de características
                if (pista.caracteristics1 != null &&
                    pista.caracteristics1!.isNotEmpty)
                  Text('- ${pista.caracteristics1}'),
                if (pista.caracteristics2 != null &&
                    pista.caracteristics2!.isNotEmpty)
                  Text('- ${pista.caracteristics2}'),
                if (pista.caracteristics3 != null &&
                    pista.caracteristics3!.isNotEmpty)
                  Text('- ${pista.caracteristics3}'),
                if (pista.caracteristics4 != null &&
                    pista.caracteristics4!.isNotEmpty)
                  Text('- ${pista.caracteristics4}'),
                const SizedBox(height: 10),

                // Descripción de la pista
                Text(
                  'Descripción:',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(pista.description),
              ],
            ),
          ),
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
