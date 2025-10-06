import 'package:flutter/material.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/Respi_Image.png',
                width: 200,
                height: 200,
              ),
              AppTitleText(text: "hola hkjhkj"),
            ],
          ),
        ),
      ),
    );
  }
}
