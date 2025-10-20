import 'package:flutter/material.dart';
import 'package:respi/catalog/demos/buttons_demo.dart';
import 'package:respi/catalog/demos/communication_demo.dart';
import 'package:respi/catalog/demos/containment_demo.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white, size: 32),
            onPressed: () {},
            padding: EdgeInsets.symmetric(horizontal: 22),
            constraints: const BoxConstraints(),
          ),
        ],
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 192, 192, 192), // color izquierdo
                Color(0xFF2E2E2E), // color derecho (más oscuro o claro)
              ],
            ),
          ),
        ),
        title: const Text('Catálogo'),
        titleTextStyle: TextStyle(
          color: const Color.fromARGB(255, 0, 0, 0),
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
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => DemoButtons()));
              },
            ),
          ),

          Card(
            child: ListTile(
              trailing: const Icon(Icons.chevron_right),
              title: Text(
                'Comunicaciones',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DemoCommunication()),
                );
              },
            ),
          ),

          Card(
            child: ListTile(
              trailing: const Icon(Icons.chevron_right),
              title: Text(
                'Contenedores',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DemoContainment()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
