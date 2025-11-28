import 'package:flutter/material.dart';
import 'package:respi/features/bookingADD/data/models/bookingAdd.dart';
import 'package:respi/core/widgets/popUpBooking.dart';

class app_container_booking extends StatelessWidget {
  final String route;
  final BookingAdd booking;
  final bool showPopup;

  const app_container_booking({
    super.key,
    required this.route,
    required this.booking,
    this.showPopup = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: SizedBox(
        width: screenWidth,
        height: 100,
        child: ElevatedButton(
          onPressed: () async {
            if (!showPopup) return; // <-- No hace nada si es false
            await showDialog(
              context: context,
              builder: (_) => Popupbooking(booking: booking),
            );
          },
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      booking.sport,
                      style: TextStyle(
                        fontSize: 18,
                        color: cs.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
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
                              color: cs.onSurface.withAlpha(180),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              booking.day,
                              style: TextStyle(
                                color: cs.onSurface.withAlpha(180),
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
                              color: cs.onSurface.withAlpha(180),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${booking.timeIni} - ${booking.timeFin}',
                              style: TextStyle(
                                color: cs.onSurface.withAlpha(180),
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
                              color: cs.onSurface.withAlpha(180),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              booking.location,
                              style: TextStyle(
                                color: cs.onSurface.withAlpha(180),
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
