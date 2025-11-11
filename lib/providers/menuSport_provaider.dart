import 'package:flutter_riverpod/legacy.dart';

/// Guarda el deporte seleccionado globalmente
final selectedSportProvider = StateProvider<String>((ref) => 'Todos');
