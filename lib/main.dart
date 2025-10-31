import 'package:flutter/material.dart';
import 'package:respi/catalog/catalog_page.dart';
import 'package:respi/catalog/demos/buttons_demo.dart';
import 'package:respi/features/auth/presentation/page/home_page.dart';
import 'package:respi/features/auth/presentation/page/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),

      // routes: {
      //   '/DemoButtons': (_) => const DemoButtons(),
      //   '/login': (_) => const LoginPage(),
      //   '/HomePage': (_) => const HomePage(),
      // },
    );
  }
}
