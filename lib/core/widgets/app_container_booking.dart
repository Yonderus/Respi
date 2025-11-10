import 'package:flutter/material.dart';
import 'package:respi/core/theme/app_colors.dart';

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

    return SizedBox(
      width: 420,
      height: 100,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.surface, // changed
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(12),
          elevation: 1,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
            const SizedBox(width: 22),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sport,
                  style: TextStyle(
                    fontSize: 18,
                    color: cs.onSurface, // changed
                    fontWeight: FontWeight.w600, // changed
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: cs.onSurface, // changed
                    ),
                    const SizedBox(width: 4),
                    Text(
                      data,
                      style: TextStyle(
                        color: cs.onSurface, // changed
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.access_time,
                      size: 14,
                      color: cs.onSurface, // changed
                    ),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: TextStyle(
                        color: cs.onSurface, // changed
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: cs.onSurface, // changed
                    ),
                    const SizedBox(width: 4),
                    Text(
                      locate,
                      style: TextStyle(
                        color: cs.onSurface, // changed
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
    );
  }
}
