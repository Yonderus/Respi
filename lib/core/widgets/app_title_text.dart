import 'package:flutter/material.dart';

class AppTitleText extends StatelessWidget {
  final String text;
  final Color? color;

  const AppTitleText({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      ),
    );
  }
}
