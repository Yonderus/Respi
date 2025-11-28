import 'package:flutter/material.dart';

class AppSelectorcourtBooking extends StatelessWidget {
  const AppSelectorcourtBooking({super.key, required this.cs});

  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.location_on, color: cs.onSurface),
          const SizedBox(width: 20),
          Text(
            'Ubicación de la Pista',
            style: TextStyle(
              color: cs.onSurface,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            color: cs.onSurface,
            onPressed: () {
              // Lista de pistas simulada
              final courts = [
                {
                  'name': 'Pista 1',
                  'image': 'lib/assets/images/juego-baloncesto.png',
                },
                {
                  'name': 'Pista 2',
                  'image': 'lib/assets/images/juego-baloncesto.png',
                },
                {
                  'name': 'Pista 3',
                  'image': 'lib/assets/images/juego-baloncesto.png',
                },
                {
                  'name': 'Pista 4',
                  'image': 'lib/assets/images/juego-baloncesto.png',
                },
                {
                  'name': 'Pista 5',
                  'image': 'lib/assets/images/juego-baloncesto.png',
                },
                {
                  'name': 'Pista 6',
                  'image': 'lib/assets/images/juego-baloncesto.png',
                },
              ];
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Seleccionar Ubicación"),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  content: SingleChildScrollView(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: courts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.8,
                            ),
                        itemBuilder: (BuildContext context, int index) {
                          final court = courts[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      court['image'] ?? '',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  court['name'] ?? '',
                                  style: TextStyle(
                                    color: cs.onSurface,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
