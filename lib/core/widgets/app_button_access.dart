import 'package:flutter/material.dart';
import 'package:respi/core/theme/app_colors.dart';

class AppButtonAccess extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() function;
  final bool izquierda;

  const AppButtonAccess({
    super.key,
    required this.text,
    required this.icon,
    required this.function,
    required this.izquierda,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final gradientBotonDark = izquierda
        ? AppColorsDark.gradientLeftToRight
        : AppColorsDark.gradientRightToLeft;

    final gradientBotonLight = izquierda
        ? AppColorsLight.gradientLeftToRight
        : AppColorsLight.gradientRightToLeft;

    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),

      // el gradiente y la sombra ahora se manejan dentro de Material
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias, // recorta los bordes redondeados
        child: Ink(
          // Ink dibuja el fondo con gradiente dentro del Material
          decoration: BoxDecoration(
            gradient: theme.brightness == Brightness.dark
                ? gradientBotonDark
                : gradientBotonLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            // InkWell reemplaza ElevatedButton y da el efecto de pulsación (ripple)
            onTap: function,
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 200,
              height: 125,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 40, color: cs.onSurface),
                  const SizedBox(height: 8),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: cs.onSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
