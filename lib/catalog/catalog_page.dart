import 'package:flutter/material.dart';
import 'package:respi/catalog/demos/buttons_demo.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(75, 75, 75, 100),
        title: const Text('Catálogo'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              trailing: const Icon(Icons.chevron_right),
              title: Text(
                'Botones',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Asegúrate de importar 'buttons_demo.dart' y que exista la clase ButtonsDemo
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => DemoButtons()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
