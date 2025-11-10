import 'package:flutter/material.dart';

// DARK THEME COLORS
class AppColorsDark {
  static const Color tagGray = Color(0xFF3A3A3A);

  // Backgrounds
  static const Color background = Color(0xFF191919); // main app background
  static const Color surface = Color(0xFF272727); // cards, panels, appbars

  static const Color brand = Color(0xFFF5CA7E); // brand color (naranja)

  static const Color textPrimary = Color(0xFFFFFFFF); // main text
  static const Color textSecondary = Color(0xFF929293); // sub text, icons

  //  gradient (for buttons)
  static const Gradient gradient = LinearGradient(
    colors: [Color(0xFF585757), Color(0xFF292929)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

// LIGHT THEME COLORS
class AppColorsLight {
  static const Color tagGray = Color(0xFF3A3A3A);

  // Backgrounds
  static const Color background = Color(0xFFE7E7E7); // main app background
  static const Color surface = Color(0xFFFFFFFF); // cards, panels, appbars

  static const Color brand = Color(0xFFF5CA7E);
  // Text
  static const Color textPrimary = Color(0xFF000000); // main text
  static const Color textSecondary = Color(0xFF1E1E1E); // sub text

  //  gradient (for buttons)
  static const Gradient gradient = LinearGradient(
    colors: [Color(0xFFFEFEFE), Color(0xFFE9E9E9)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
