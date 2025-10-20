import 'package:flutter/material.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';

class DemoButtons extends StatelessWidget {
  const DemoButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(texto: 'Botones'),

      body: Container(
        decoration: BoxDecoration(color: Colors.grey[900]),
        child: Center(
          child: Column(
            children: [
              //Primer botón
              Container(
                margin: const EdgeInsets.only(top: 100, bottom: 20),
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 196, 240, 52),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Text(
                  'Aquí dentro va un texto',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              //Segundo botón
              Container(
                margin: const EdgeInsets.only(top: 100, bottom: 20),
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 196, 240, 52),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Aquí dentro va un texto',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              //Tercer botón
              Container(
                margin: const EdgeInsets.only(top: 100, bottom: 20),
                width: 200,
                height: 125,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 76, 76, 76),
                      Color.fromARGB(255, 157, 156, 156),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Icon(Icons.visibility, size: 40, color: Colors.white),
                    Text(
                      'Unirse',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              //Cuarto botón
              Container(
                margin: const EdgeInsets.only(top: 100, bottom: 20),
                child: Icon(Icons.arrow_back, size: 40, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
