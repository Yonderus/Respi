import 'package:flutter/material.dart';

class AppButtonAccess extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() function;

  const AppButtonAccess({
    super.key,
    required this.text,
    required this.icon,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70, bottom: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 80, 80, 80),
            Color.fromARGB(255, 222, 223, 224),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: 200,
        height: 125,
        child: ElevatedButton(
          onPressed: () {
            function();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              Icon(icon, size: 40, color: Colors.white),
              Text(
                text,
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
      ),
    );
  }
}

// // ignore: non_constant_identifier_names
// Container app_button_access(
//   String texto,
//   IconData icono,
//   Function funcionAEjecutar,
// ) {
//   return Container(
//     margin: const EdgeInsets.only(top: 70, bottom: 20),
//     decoration: BoxDecoration(
//       gradient: const LinearGradient(
//         colors: [
//           Color.fromARGB(255, 80, 80, 80),
//           Color.fromARGB(255, 222, 223, 224),
//         ],
//         begin: Alignment.centerLeft,
//         end: Alignment.centerRight,
//       ),
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: SizedBox(
//       width: 200,
//       height: 125,
//       child: ElevatedButton(
//         onPressed: () {
//           funcionAEjecutar();
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//         child: Column(
//           children: [
//             Padding(padding: EdgeInsets.only(top: 20)),
//             Icon(icono, size: 40, color: Colors.white),
//             Text(
//               texto,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
