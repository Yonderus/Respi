import 'package:respi/core/l10n/app_localizations.dart';

extension JoinTranslations on AppLocalizations {
  // Court names
  String joinName(String original) {
    switch (original) {
      case 'Cancha de Basket 3 vs 3':
        return join_basket_3v3;
      case 'Pista de Pádel Doble':
        return join_padel_doble;
      case 'Campo de Fútbol 7':
        return join_futbol7;
      case 'Cancha de Tenis Individual':
        return join_tenis_individual;
      case 'Cancha de Vóley Playa 2 vs 2':
        return join_voley_2v2;
      default:
        return original;
    }
  }

  // Levels
  String joinLevel(String original) {
    switch (original) {
      case 'Principiante':
        return join_level_beginner;
      case 'Intermedio':
        return join_level_intermediate;
      default:
        return original;
    }
  }
}
