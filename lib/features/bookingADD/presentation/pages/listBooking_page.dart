import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/listarReservas.dart';
import 'package:respi/features/Users/providers/auth_providers.dart';
import 'package:respi/features/bookingADD/controllers/AddBookingController.dart';

class ListbookingPage extends ConsumerWidget {
  const ListbookingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    // Usuario logueado
    final user = ref.watch(currentUserProvider);
    final String? userEmail = user?.email;

    // Reservas añadidas (provider)
    final bookingAddAsync = ref.watch(bookingAddProvider);

    return Container(
      decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                bookingAddAsync.when(
                  data: (reservas) {
                    // Si no hay usuario logueado
                    if (userEmail == null) {
                      return const Center(
                        child: Text("No hay usuario logueado"),
                      );
                    }

                    // Filtrar SOLO reservas del usuario
                    final userReservas = reservas
                        .where(
                          (r) =>
                              r.userEmail.toLowerCase() ==
                              userEmail.toLowerCase(),
                        )
                        .toList();

                    // Función para obtener DateTime de la reserva
                    DateTime parseReservaDate(String day, String time) {
                      final date = DateTime.parse(day);
                      final parts = time.split(':');
                      return DateTime(
                        date.year,
                        date.month,
                        date.day,
                        // Hora de inicio
                        int.parse(parts[0]),
                        // Minuto de inicio
                        int.parse(parts[1]),
                      );
                    }

                    final now = DateTime.now();

                    // PRÓXIMAS RESERVAS
                    // Aqui realizamos el filtrado de las reservas dependiendo
                    // si son futuras o pasadas
                    final reservasProximas = userReservas.where((r) {
                      final fecha = parseReservaDate(r.day, r.timeIni);
                      return fecha.isAfter(now);
                    }).toList();

                    // RESERVAS PASADAS
                    // Aqui realizamos el filtrado de las reservas dependiendo
                    // si son futuras o pasadas
                    final reservasPasadas = userReservas.where((r) {
                      final fecha = parseReservaDate(r.day, r.timeIni);
                      return fecha.isBefore(now);
                    }).toList();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ---------------------------
                        //   RESERVAS FUTURAS
                        // ---------------------------
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: Text(
                            '${l10n.upcomingReservations}: ',
                            style: TextStyle(
                              color: cs.onSurface,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (reservasProximas.isEmpty)
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text("No tienes reservas próximas"),
                          )
                        else
                          listarReservas(
                            reservasProximas,
                            ref,
                            true,
                          ), // Popup activado
                        // ---------------------------
                        //   RESERVAS PASADAS
                        // ---------------------------
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: Text(
                            'Reservas Realizadas: ',
                            style: TextStyle(
                              color: cs.onSurface,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (reservasPasadas.isEmpty)
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text("No tienes reservas realizadas"),
                          )
                        else
                          listarReservas(
                            reservasPasadas,
                            ref,
                            false,
                          ), // No popup
                      ],
                    );
                  },

                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('Error: $err')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
