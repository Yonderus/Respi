import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/bookingADD/data/models/bookingAdd.dart';
import 'package:respi/features/bookingADD/data/repositories/BookingAdd_Repository.dart';

final bookingAddRepositoryProvider = Provider<BookingAddRepository>((ref) {
  return BookingAddRepository();
});

class ConfirmBookingPage extends ConsumerWidget {
  final BookingAdd booking;

  const ConfirmBookingPage({super.key, required this.booking});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;

    Widget buildCard(
      String title,
      String value, {
      IconData? icon,
      Color? bgColor,
    }) {
      return Card(
        color: bgColor ?? cs.surface,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: icon != null
              ? Icon(icon, color: cs.primary, size: 30)
              : null,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: cs.onSurface,
            ),
          ),
          subtitle: Text(
            value,
            style: TextStyle(fontSize: 18, color: cs.onSurfaceVariant),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Confirmar Reserva")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Text(
                "Detalles de la Reserva",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: cs.onSurface,
                ),
              ),
              const SizedBox(height: 20),

              // Cards con info
              buildCard(
                "Deporte:",
                booking.sport,
                icon: Icons.sports,
                bgColor: cs.surface.withOpacity(0.9),
              ),
              buildCard("Fecha:", booking.day, icon: Icons.calendar_today),
              buildCard(
                "Hora Inicio:",
                booking.timeIni,
                icon: Icons.access_time,
              ),
              buildCard("Hora Fin:", booking.timeFin, icon: Icons.access_time),
              buildCard(
                "Ubicación:",
                booking.location,
                icon: Icons.location_on,
              ),
              buildCard(
                "Jugadores:",
                booking.numberOfPlayers.toString(),
                icon: Icons.people,
              ),
              buildCard(
                "Privada:",
                booking.isPrivate ? "Sí" : "No",
                icon: Icons.lock,
              ),

              const SizedBox(height: 30),

              // Botones con iconos y colores vivos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    icon: const Icon(Icons.close, color: Colors.white),
                    label: const Text(
                      "Cancelar",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final repo = ref.read(bookingAddRepositoryProvider);
                      await repo.addBooking(booking);

                      Navigator.pop(context); // cerrar confirmación
                      Navigator.pop(context); // cerrar AddBookingPage

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("Reserva confirmada"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    icon: const Icon(Icons.check, color: Colors.white),
                    label: const Text(
                      "Confirmar",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
