import 'package:flutter/material.dart';

Widget buildTag(
  BuildContext context,
  String text, {
  Color? textColor,
  Color? backgroundColor,
}) {
  // Gris clarito que combina bien con ambos temas
  final theme = Theme.of(context);
  final cs = theme.colorScheme;

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: cs.tertiary,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: textColor ?? cs.onTertiary,
      ),
    ),
  );
}
