import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/widgets/app_bottomBar.dart';
import 'package:respi/providers/bottom_nav_provider.dart';

class BookingPage extends ConsumerStatefulWidget {
  const BookingPage({super.key});

  @override
  ConsumerState<BookingPage> createState() => _BookingPageState();
}

// ...existing code...
class _BookingPageState extends ConsumerState<BookingPage> {
  @override
  void initState() {
    super.initState();
    // Deferimos la modificación del provider hasta que termine el primer frame
    // para evitar modificar el estado mientras el framework está construyendo
    // widgets (puede provocar warnings o comportamientos indeseados).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // `ref` viene de ConsumerState: es la forma de interactuar con Riverpod.
      // Aquí usamos `read` porque no necesitamos que este método vuelva a
      // ejecutarse cuando el provider cambie (no estamos escuchando).
      //
      // `bottomNavIndexProvider` probablemente sea un StateProvider<int>.
      // - `.notifier` devuelve el StateController<int> (el "notifier").
      // - `.state = 1` cambia el valor almacenado por el provider a 1.
      //
      // Efecto: actualiza el índice seleccionado de la barra inferior a 1.
      ref.read(bottomNavIndexProvider.notifier).state = 1;
      //
      // Alternativas:
      // - ref.read(bottomNavIndexProvider.notifier).update((prev) => 1);
      // - Si desde el build quieres reaccionar a cambios, usa `ref.watch(...)`
      //   en lugar de `ref.read(...)`.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(texto: 'Reservar Pistas'),
      bottomNavigationBar: AppBottombar(),
    );
  }
}
