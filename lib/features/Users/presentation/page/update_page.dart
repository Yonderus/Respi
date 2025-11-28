import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/Users/providers/auth_providers.dart';
import 'package:respi/features/Users/providers/controllers_providers.dart';

class UpdatePage extends ConsumerWidget {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final usernameCtrl = ref.watch(usernamectrlProvider);
    final passwordCtrl = ref.watch(passwordctrlProvider);
    final newPasswordCtrl = ref.watch(newPasswordctrlProvider);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text("Editar Perfil"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: usernameCtrl,
            decoration: const InputDecoration(
              labelText: "Nuevo Nombre",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 12),
          Text('Introduce tu contraseña actual:'),

          TextField(
            controller: passwordCtrl,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Contraseña",
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          Text('Introduce la nueva contraseña:'),
          TextField(
            controller: newPasswordCtrl,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Contraseña nueva",
              prefixIcon: Icon(Icons.lock),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancelar"),
        ),
        FilledButton(
          onPressed: () async {
            if (user == null) {
              return;
            }
            final result = await ref
                .read(authProvider.notifier)
                .userUpdate(
                  user,
                  usernameCtrl.text,
                  passwordCtrl.text,
                  newPasswordCtrl.text,
                );
            newPasswordCtrl.clear();
            usernameCtrl.clear();
            passwordCtrl.clear();

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(result ?? "Actualizado")));
            Navigator.pop(context);
          },

          child: const Text("Guardar"),
        ),
      ],
    );
  }
}
