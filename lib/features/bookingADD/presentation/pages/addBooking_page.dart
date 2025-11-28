import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_button.dart';
import 'package:respi/core/widgets/app_selectorCourt_booking.dart';
import 'package:respi/features/Users/providers/auth_providers.dart';
import 'package:respi/features/bookingADD/data/models/bookingAdd.dart';
import 'package:respi/features/bookingADD/data/repositories/BookingAdd_Repository.dart';
import 'package:respi/features/bookingADD/presentation/pages/confirmBooking_page.dart';
import 'package:respi/providers/selected_booking_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class AddbookingPage extends ConsumerStatefulWidget {
  const AddbookingPage({super.key});

  @override
  ConsumerState<AddbookingPage> createState() => _AddbookingPageState();
}

final bookingAddRepositoryProvider = Provider<BookingAddRepository>((ref) {
  return BookingAddRepository();
});

class _AddbookingPageState extends ConsumerState<AddbookingPage> {
  DateTime _selectedDay = DateTime.now();
  TimeOfDay? _selectedTimeIni;
  TimeOfDay? _selectedTimeFin;
  bool isPrivate = false;
  int _selectedPeople = 1;
  final int _maxPeople = 6;

  // Horas disponibles 9:00 a 20:00
  final List<TimeOfDay> _availableTimes = List.generate(
    12,
    (index) => TimeOfDay(hour: 9 + index, minute: 0),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Lee el booking seleccionado desde Riverpod (o similar).
    final booking = ref.watch(selectedBookingProvider);
    //Lee el archivo de usuario actual
    final user = ref.watch(currentUserProvider);

    // Tema actual de la app y su esquema de colores para estilos coherentes.
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    // Si no hay pista/booking seleccionado, muestra una pantalla que lo indica.
    if (booking == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Nueva Reserva')),
        body: Center(
          child: Text(l10n.noCourtSel, style: TextStyle(color: cs.onSurface)),
        ),
      );
    }

    // Si hay booking, construye la UI completa de creación de reserva.
    return Scaffold(
      appBar: AppBar(title: Text('${booking.sport}  --  Nueva Reserva')),
      body: SingleChildScrollView(
        // Permite scroll si la pantalla no cabe.
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Título Fecha ---
              Text(
                'Fecha:',
                style: TextStyle(
                  color: cs.onSurface,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              // --- Calendario ---
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: cs.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TableCalendar(
                  // Rango válido desde hoy hasta +365 días.
                  firstDay: DateTime.now(),
                  lastDay: DateTime.now().add(const Duration(days: 365)),
                  // _selectedDay es el estado local que refleja la fecha enfocada/seleccionada.
                  focusedDay: _selectedDay,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  // Marca el día seleccionado en la UI.
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  // Cuando el usuario selecciona un día actualiza estado.
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: cs.primary,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: cs.secondary,
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle: TextStyle(color: cs.error),
                    defaultTextStyle: TextStyle(color: cs.onSurface),
                    outsideDaysVisible: true,
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: cs.onSurface,
                    ),
                    leftChevronIcon: Icon(Icons.arrow_back, color: cs.primary),
                    rightChevronIcon: Icon(
                      Icons.arrow_forward,
                      color: cs.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // --- Título Hora ---
              Text(
                'Selecciona la Hora:',
                style: TextStyle(
                  color: cs.onSurface,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              // --- Selector de horas (SELECCIÓN DE DOS HORAS: inicio y fin) ---
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cs.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  // _availableTimes es una lista de TimeOfDay (horas posibles).
                  children: _availableTimes.map((time) {
                    // Comprobaciones para estilos: si es inicio, fin o parte del rango.
                    final isStart = _selectedTimeIni == time;
                    final isEnd = _selectedTimeFin == time;

                    bool isInRange = false;
                    // Si hay inicio y fin seleccionados, comprueba si 'time' está en medio.
                    if (_selectedTimeIni != null && _selectedTimeFin != null) {
                      final hIni = _selectedTimeIni!.hour;
                      final hFin = _selectedTimeFin!.hour;
                      if (time.hour > hIni && time.hour < hFin) {
                        isInRange = true;
                      }
                    }

                    return GestureDetector(
                      // Maneja la lógica de selección:
                      // - Primera pulsación = inicio (_selectedTimeIni)
                      // - Segunda pulsación = fin (_selectedTimeFin) (si es menor intercambia)
                      // - Si ya había dos, reinicia con la nueva como inicio.
                      onTap: () {
                        setState(() {
                          if (_selectedTimeIni == null) {
                            // Primera selección
                            _selectedTimeIni = time;
                          } else if (_selectedTimeFin == null) {
                            // Segunda selección
                            if (time.hour < _selectedTimeIni!.hour) {
                              // Si el usuario pulsa una hora menor, intercambia para que orden sea correcta.
                              _selectedTimeFin = _selectedTimeIni;
                              _selectedTimeIni = time;
                            } else {
                              _selectedTimeFin = time;
                            }
                          } else {
                            // Ya había inicio y fin: reinicia con la nueva hora como inicio.
                            _selectedTimeIni = time;
                            _selectedTimeFin = null;
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          // Cambia color según estado (inicio, fin, rango, normal).
                          color: isStart
                              ? cs.primary
                              : isEnd
                              ? cs.primary.withOpacity(0.9)
                              : isInRange
                              ? cs.primary.withOpacity(0.3)
                              : cs.surface,
                          border: Border.all(
                            color: isStart || isEnd || isInRange
                                ? cs.primary
                                : cs.outline,
                          ),
                        ),
                        child: Text(
                          time.format(
                            context,
                          ), // Formatea TimeOfDay a cadena local.
                          style: TextStyle(
                            color: isStart || isEnd || isInRange
                                ? cs.onPrimary
                                : cs.onSurfaceVariant,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 40),

              // --- Selector de ubicación/pista ---
              AppSelectorcourtBooking(cs: cs),

              const SizedBox(height: 40),

              // --- Selector Personas ---
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cs.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, color: cs.onSurface),
                    const SizedBox(width: 20),
                    Text(
                      'Número de Personas',
                      style: TextStyle(
                        color: cs.onSurface,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Botón '-' desactiva si _selectedPeople <= 1
                    IconButton(
                      icon: Icon(Icons.remove, color: cs.onSurface),
                      onPressed: _selectedPeople > 1
                          ? () {
                              setState(() {
                                _selectedPeople--;
                              });
                            }
                          : null,
                    ),
                    Text(
                      '$_selectedPeople', // Muestra cantidad seleccionada
                      style: TextStyle(
                        color: cs.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Botón '+' desactiva si llega al máximo
                    IconButton(
                      icon: Icon(Icons.add, color: cs.onSurface),
                      onPressed: _selectedPeople < _maxPeople
                          ? () {
                              setState(() {
                                _selectedPeople++;
                              });
                            }
                          : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // --- Reserva Privada (Switch) ---
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cs.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.lock, color: cs.onSurface),
                  title: Text(
                    "Reserva Privada",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: cs.onSurface,
                    ),
                  ),
                  trailing: Switch(
                    value: isPrivate,
                    activeThumbColor: cs.primary,
                    onChanged: (bool value) {
                      setState(() {
                        isPrivate = value; // Alterna el booleano
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // --- Botón Confirmar / Continuar ---
              Center(
                child: AppButton(
                  text: 'Continuar',
                  radius: 8.0,
                  onPressed: () {
                    if (_selectedTimeIni == null || _selectedTimeFin == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Por favor, selecciona hora inicio y fin.',
                            style: TextStyle(color: cs.onError),
                          ),
                          backgroundColor: cs.error,
                        ),
                      );
                      return;
                    }

                    final bookingAdd = BookingAdd(
                      sport: booking.sport,
                      day:
                          '${_selectedDay.year}-${_selectedDay.month.toString().padLeft(2, '0')}-${_selectedDay.day.toString().padLeft(2, '0')}',
                      timeIni:
                          '${_selectedTimeIni!.hour.toString().padLeft(2, '0')}:${_selectedTimeIni!.minute.toString().padLeft(2, '0')}',
                      timeFin:
                          '${_selectedTimeFin!.hour.toString().padLeft(2, '0')}:${_selectedTimeFin!.minute.toString().padLeft(2, '0')}',
                      location: booking.location,
                      numberOfPlayers: _selectedPeople,
                      isPrivate: isPrivate,
                      userEmail: user?.email ?? '',
                    );

                    // Ir a pantalla de confirmación
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ConfirmBookingPage(booking: bookingAdd),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
