import 'package:flutter/material.dart';
import 'package:respi/core/widgets/app_button.dart';
import 'package:respi/core/widgets/buildTag.dart';
import 'package:respi/core/l10n/app_localizations.dart';

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
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;
    final t = AppLocalizations.of(context)!;

    return SizedBox(
      width: 400,
      height: 240,
      child: Card(
        color: cs.surface,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Imagen de fondo
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(routeImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Faltan X personas (traducido)
            if (personasNecesarias != null)
              Positioned(
                top: 10,
                left: 10,
                child: buildTag(
                  context,
                  t.join_missingPeople(personasNecesarias!),
                  textColor: cs.primary,
                ),
              ),

            // Nivel (Principiante / Intermedio...)
            if (level != null)
              Positioned(
                top: 10,
                right: 10,
                child: buildTag(context, level!, textColor: cs.inverseSurface),
              ),

            // Contenedor inferior
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: cs.surface.withValues(alpha: 0.95),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    // Nombre y precio
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Expanded con maxlines 2 para que haga un
                        //salto de linea que queda mejor que los 3 puntos que
                        //habian antes
                        Expanded(
                          child: Text(
                            text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: cs.onSurface,
                            ),
                          ),
                        ),

                        Text(
                          "$pricePerson€\n${t.join_perPerson}",
                          textAlign: TextAlign.right,
                          style: textTheme.bodyMedium?.copyWith(
                            color: cs.onSurface.withValues(alpha: 0.7),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Botón de Unirse (traducido)
                    Center(child: AppButton(text: t.join_joinButton)),
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
