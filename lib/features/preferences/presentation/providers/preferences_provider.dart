import 'dart:ui';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ---------- ENUM Y LOCALES ----------
enum AppLanguage { en, es, fr, de }

const supportedLocales = [
  Locale('en'),
  Locale('es'),
  Locale('fr'),
  Locale('de'),
];

extension AppLanguageExtension on AppLanguage {
  Locale get locale {
    switch (this) {
      case AppLanguage.en:
        return const Locale('en');
      case AppLanguage.es:
        return const Locale('es');
      case AppLanguage.fr:
        return const Locale('fr');
      case AppLanguage.de:
        return const Locale('de');
    }
  }
}

/// ---------- PROVIDERS ----------

// Tema (claro/oscuro)
// Este provider conecta la clase ThemeNotifier con el resto de la app,
// y su estado es un bool.
final themeModeProvider = StateNotifierProvider<ThemeNotifier, bool>(
  (ref) => ThemeNotifier(),
);

// Idioma (en/es)
final languageProvider = StateNotifierProvider<LanguageNotifier, AppLanguage>(
  (ref) => LanguageNotifier(),
);

/// ---------- NOTIFIERS ----------

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getBool('darkMode');
    if (saved != null) state = saved;
  }

  Future<void> setTheme(bool value) async {
    state = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', value);
  }
}

class LanguageNotifier extends StateNotifier<AppLanguage> {
  LanguageNotifier() : super(AppLanguage.es) {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('language');
    if (saved != null) {
      state = AppLanguage.values.firstWhere(
        (lang) => lang.name == saved,
        orElse: () => AppLanguage.es,
      );
    }
  }

  Future<void> setLanguage(AppLanguage lang) async {
    state = lang;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang.name);
  }
}
