import 'package:flutter/material.dart';
import 'package:respi/features/Users/presentation/page/login_page.dart';
import 'package:respi/features/preferences/presentation/pages/preferences_page.dart';

class ProfileSettingsBlock extends StatelessWidget {
  const ProfileSettingsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // --- Notificaciones ---
          ListTile(
            leading: const Icon(Icons.notifications_none),
            title: const Text("Notificaciones"),
            trailing: Switch(
              value: true,
              activeColor: const Color(0xFFAEC56E), // verde del diseño
              onChanged: (_) {},
            ),
          ),

          const Divider(height: 1),

          // --- Política y Privacidad ---
          ListTile(
            leading: const Icon(Icons.shield_outlined),
            title: const Text("Política y Privacidad"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PreferencesPage()),
              );
            },
          ),

          const Divider(height: 1),

          // --- Cerrar Sesión ---
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              "Cerrar Sesion",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
