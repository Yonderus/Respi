import 'package:flutter/material.dart';
import 'app_colors.dart';

// DARK THEME
final ColorScheme darkColorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: AppColorsDark.brand, // naranja (color de la marca)
  onPrimary:
      Colors.black, // texto o iconos que estan sobre el color de la marca
  secondary: AppColorsDark.surface, // surface se gasta otra vez para secondary
  onSecondary: AppColorsDark.textPrimary,
  surface: AppColorsDark.surface, // cards, panels
  onSurface: AppColorsDark.textPrimary,
  tertiary: AppColorsDark.tagGray,
  onTertiary: Colors.white,
  inverseSurface: Color(0xFFBDBDBD), // gris claro (fondo chip no seleccionado)
  onInverseSurface: Color(
    0xFF424242,
  ), // gris oscuro (texto/icono chip no seleccionado)

  error: Color(0xFFE53935),
  onError: Colors.white,
);

final ThemeData darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColorsDark.background,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColorsDark.surface,
    titleTextStyle: TextStyle(
      color: AppColorsDark.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: AppColorsDark.textPrimary),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColorsDark.textPrimary),
    bodyMedium: TextStyle(color: AppColorsDark.textSecondary),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorsDark.brand,
      foregroundColor: Colors.black,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  ),
);

// LIGHT THEME
final ColorScheme lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: AppColorsLight.brand,
  onPrimary: Colors.black,
  secondary: AppColorsLight.surface,
  onSecondary: AppColorsLight.textPrimary,
  surface: AppColorsLight.surface,
  onSurface: AppColorsLight.textPrimary,
  tertiary: AppColorsLight.tagGray,
  onTertiary: Colors.white,
  inverseSurface: Color(0xFFBDBDBD), // gris claro (fondo chip no seleccionado)
  onInverseSurface: Color(0xFF424242),

  // gris oscuro (texto/icono chip no seleccionado)
  error: Color(0xFFE53935),
  onError: Colors.white,
);

final ThemeData lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColorsLight.background,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColorsLight.surface,
    titleTextStyle: TextStyle(
      color: AppColorsLight.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: AppColorsLight.textPrimary),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColorsLight.textPrimary),
    bodyMedium: TextStyle(color: AppColorsLight.textSecondary),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorsLight.brand,
      foregroundColor: Colors.black,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  ),
);
