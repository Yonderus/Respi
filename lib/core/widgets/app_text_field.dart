import 'package:flutter/material.dart';

enum AppTextFieldVariant { light, danger }

class AppTextFieldStyle {
  final Color fillColor;
  final Color iconColor;
  final Color textColor;
  final Color borderColor;

  const AppTextFieldStyle({
    required this.fillColor,
    required this.iconColor,
    required this.textColor,
    required this.borderColor,
  });
}

AppTextFieldStyle getStyleForVariant(
  AppTextFieldVariant variant,
  BuildContext context,
) {
  final theme = Theme.of(context);
  final cs = theme.colorScheme;
  switch (variant) {
    case AppTextFieldVariant.light:
      return AppTextFieldStyle(
        fillColor: cs.secondary, // fondo de la caja
        iconColor: cs.primary, // color del icono
        textColor: cs.onSurface, // color del texto
        borderColor: cs.inverseSurface, // color del borde
      );

    case AppTextFieldVariant.danger:
      return AppTextFieldStyle(
        fillColor: Colors.red.shade50,
        iconColor: Colors.red,
        textColor: Colors.red.shade900,
        borderColor: Colors.red,
      );
  }
}

class AppTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AppTextFieldVariant variant;

  const AppTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.obscureText,
    this.controller,
    this.validator,
    this.variant = AppTextFieldVariant.light,
  });

  @override
  Widget build(BuildContext context) {
    final style = getStyleForVariant(variant, context);

    return SizedBox(
      width: 270,
      height: 45,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        style: TextStyle(color: style.textColor),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(color: style.textColor.withValues(alpha: 0.6)),
          prefixIcon: Icon(icon, color: style.iconColor),
          filled: true,
          fillColor: style.fillColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: style.borderColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: style.borderColor, width: 2),
          ),
        ),
      ),
    );
  }
}
