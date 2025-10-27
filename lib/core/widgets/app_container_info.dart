import 'package:flutter/material.dart';

// ignore: camel_case_types
class app_container_info extends StatelessWidget {
  const app_container_info({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 250,
      child: Card(
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/fondo-basket.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
