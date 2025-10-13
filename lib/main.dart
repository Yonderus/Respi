// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:respi/core/widgets/app_text_field.dart';
import 'package:respi/core/widgets/app_title_text.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 340,
            height: 550,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 72, 72, 72),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Image.asset(
                  'lib/assets/images/Respi_Image.png',
                  width: 200,
                  height: 200,
                ),
                AppTitleText(text: "Bienvenido a ResPi"),

                Text(
                  "Sign in to continue",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: 270,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Continue with Google"),
                  ),
                ),

                SizedBox(height: 12),

                Text(
                  "--------------- OR ---------------",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),

                SizedBox(height: 12),

                app_text_field('Email'),
                const SizedBox(height: 12),
                app_text_field('Password'),
                const SizedBox(height: 20),

                SizedBox(
                  width: 270,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDDF864),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Sign In"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
