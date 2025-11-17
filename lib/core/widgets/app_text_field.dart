import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
SizedBox app_text_field(
  String label,
  IconData icon,
  bool obscureText, {
  TextEditingController? controller,
  String? Function(String?)? validator,
  Color? fillColor,
  Color? iconColor,
  Color? textColor,
  Color? borderColor, // ➜ color opcional del borde
}) {
  return SizedBox(
    width: 270,
    height: 40,
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(color: textColor), // color del texto
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(color: textColor?.withValues(alpha: 0.6)),
        prefixIcon: Icon(icon, color: iconColor),
        filled: true,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          // borde normal
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          // borde cuando el campo esta enfocado
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor ?? Colors.red, width: 2),
        ),
      ),
    ),
  );
}
