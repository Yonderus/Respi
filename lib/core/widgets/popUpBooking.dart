import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/bookingADD/controllers/AddBookingController.dart';
import 'package:respi/features/bookingADD/data/models/bookingAdd.dart';

class Popupbooking extends ConsumerStatefulWidget {
  final BookingAdd booking;
  const Popupbooking({super.key, required this.booking});

  @override
  ConsumerState<Popupbooking> createState() => _PopupbookingState();
}

class _PopupbookingState extends ConsumerState<Popupbooking> {
  late TextEditingController dayCtrl;
  late TextEditingController timeIniCtrl;
  late TextEditingController timeFinCtrl;
  late TextEditingController locationCtrl;
  late TextEditingController playersCtrl;
  late bool isPrivate;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    dayCtrl = TextEditingController(text: widget.booking.day);
    timeIniCtrl = TextEditingController(text: widget.booking.timeIni);
    timeFinCtrl = TextEditingController(text: widget.booking.timeFin);
    locationCtrl = TextEditingController(text: widget.booking.location);
    playersCtrl = TextEditingController(
      text: widget.booking.numberOfPlayers.toString(),
    );
    isPrivate = widget.booking.isPrivate;
  }

  @override
  void dispose() {
    dayCtrl.dispose();
    timeIniCtrl.dispose();
    timeFinCtrl.dispose();
    locationCtrl.dispose();
    playersCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Editar reserva"),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildField("Día", dayCtrl),
            _buildField("Hora inicio", timeIniCtrl),
            _buildField("Hora fin", timeFinCtrl),
            _buildField("Ubicación", locationCtrl),
            _buildField("Jugadores", playersCtrl, isNumber: true),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Privado",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: isPrivate,
                  onChanged: isEditing
                      ? (v) => setState(() => isPrivate = v)
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        // BOTON DE BORRAR
        TextButton(
          onPressed: () {
            ref.read(bookingAddProvider.notifier).deleteBooking(widget.booking);
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: const Text("Borrar  reserva"),
        ),
        // BOTON DE EDITAR / GUARDAR
        FilledButton(
          onPressed: () async {
            if (!isEditing) {
              setState(() => isEditing = true);
              return;
            }

            final updatedBooking = BookingAdd(
              id: widget.booking.id,
              sport: widget.booking.sport,
              day: dayCtrl.text,
              timeIni: timeIniCtrl.text,
              timeFin: timeFinCtrl.text,
              location: locationCtrl.text,
              numberOfPlayers: int.tryParse(playersCtrl.text) ?? 0,
              isPrivate: isPrivate,
              userEmail: widget.booking.userEmail,
            );

            await ref
                .read(bookingAddProvider.notifier)
                .updateBooking(updatedBooking);
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          },
          child: Text(isEditing ? "Guardar" : "Editar"),
        ),
      ],
    );
  }

  Widget _buildField(
    String label,
    TextEditingController ctrl, {
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: ctrl,
        readOnly: !isEditing,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        style: TextStyle(
          color: Colors.black, // Texto negro siempre
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey[700], // Label siempre gris
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          fillColor: isEditing
              ? Colors.white
              : Colors.grey[300], // Fondo claro en edición
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none, // Sin borde
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
      ),
    );
  }
}
