// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget buildTag(
  String text, {
  Color backgroundColor = const Color.fromARGB(254, 224, 224, 225),
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
    ),
  );
}
