import 'package:flutter/material.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';

class DemoContainment extends StatelessWidget {
  const DemoContainment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(texto: "Contenedores"),

      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF6B6B6B)),

        child: Center(child: Container()),
      ),
    );
  }
}
