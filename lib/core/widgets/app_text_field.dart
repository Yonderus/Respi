import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
SizedBox app_text_field(String label, IconData icon) {
  return SizedBox(
    width: 270,
    height: 40,
    child: TextField(
      decoration: InputDecoration(
        hint: Text(label, style: TextStyle(color: Colors.grey)),
        prefixIcon: Icon(icon, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
