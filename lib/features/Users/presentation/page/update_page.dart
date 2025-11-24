// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class UpdateDialog extends ConsumerStatefulWidget {
//   const UpdateDialog({super.key});

//   @override
//   ConsumerState<UpdateDialog> createState() => _UpdateDialogState();
// }

// class _UpdateDialogState extends ConsumerState<UpdateDialog> {
//   final _emailCtrl = TextEditingController();
//   final _usernameCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _emailCtrl.dispose();
//     _usernameCtrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cs = Theme.of(context).colorScheme;

//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       title: const Text("Editar información"),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             controller: _usernameCtrl,
//             decoration: const InputDecoration(
//               labelText: "Nombre",
//               prefixIcon: Icon(Icons.person),
//             ),
//           ),
//           const SizedBox(height: 12),
//           TextField(
//             controller: _emailCtrl,
//             decoration: const InputDecoration(
//               labelText: "Email",
//               prefixIcon: Icon(Icons.email),
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text("Cancelar"),
//         ),
//         FilledButton(
//           onPressed: () {
//             // Aquí guardas los cambios si quieres
//             Navigator.pop(context);
//           },
//           child: const Text("Guardar"),
//         ),
//       ],
//     );
//   }
// }
