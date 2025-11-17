import 'package:flutter/material.dart';
import 'package:respi/core/widgets/app_button.dart';
import 'package:respi/features/bookings/data/models/CourtBooking.dart';
import 'buildTag.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/l10n/court_translations.dart'; // <-- ADDED

class app_container_info extends StatelessWidget {
  final CourtBooking pista;

  const app_container_info({super.key, required this.pista});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final t = AppLocalizations.of(context)!; // <-- ADDED

    return SizedBox(
      width: 400,
      height: 250,
      child: Card(
        color: colorScheme.surface,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(pista.routeImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () => _dialogBuilder(context, pista),
                child: Icon(
                  Icons.info_outline,
                  color: colorScheme.inverseSurface,
                  size: 30,
                ),
              ),
            ),

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            t.courtName(pista.text),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${pista.price}€\n${t.booking_perHour}",
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

                    Row(
                      children: [
                        buildTag(context, t.courtTag(pista.etiqueta1)),
                        const SizedBox(width: 8),
                        buildTag(context, t.courtTag(pista.etiqueta2)),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Center(child: AppButton(text: t.reserveNow)),
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
    final t = AppLocalizations.of(context)!;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(t.courtInfo),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(pista.routeImg),
                const SizedBox(height: 10),

                Text(
                  t.courtName(pista.text),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),
                Text(
                  t.courtLocation(pista.location),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),
                Text(
                  "${t.capacity}: ${t.courtCapacity(pista.capacity)}",
                ), // <-- TRANSLATED

                const SizedBox(height: 10),
                Text(
                  t.characteristics,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),
                if (pista.caracteristics1!.isNotEmpty)
                  Text("- ${t.courtChar(pista.caracteristics1!)}"),
                if (pista.caracteristics2!.isNotEmpty)
                  Text("- ${t.courtChar(pista.caracteristics2!)}"),
                if (pista.caracteristics3!.isNotEmpty)
                  Text("- ${t.courtChar(pista.caracteristics3!)}"),
                if (pista.caracteristics4!.isNotEmpty)
                  Text("- ${t.courtChar(pista.caracteristics4!)}"),

                const SizedBox(height: 10),
                Text(
                  t.description,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),
                Text(t.courtDescription(pista.description)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(t.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
