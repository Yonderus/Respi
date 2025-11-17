import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/features/auth/presentation/page/login_page.dart';
import 'package:respi/features/auth/presentation/widgets/profile_stats_box.dart';
import 'package:respi/features/auth/presentation/widgets/quick_action_tile.dart';
import 'package:respi/features/preferences/presentation/pages/preferences_page.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        //gradiente de fondo que solo se usa en la pagina de perfil
        gradient: LinearGradient(
          colors: [cs.surface, cs.primaryContainer, cs.surface],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Tarjeta que contiene foto perfil , nom usuario y gmail
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Foto de perfil (ahora RS)
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: cs.primary,
                        child: Text(
                          'RS',
                          style: textTheme.headlineSmall?.copyWith(
                            color: cs.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      //Nombre de usuario
                      Text(
                        'Respi User',
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      //correo
                      Text(
                        'usuario@respi.app',
                        style: textTheme.bodyMedium?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          ProfileStat(
                            label: 'Reservas',
                            value: '12',
                            color: cs.primary,
                          ),
                          const SizedBox(width: 16),
                          //Ejemplos si se quiere mas estadisticas
                          // _ProfileStat(
                          //   label: 'Favoritos',
                          //   value: '5',
                          //   color: cs.secondary,
                          // ),
                          // const SizedBox(width: 16),
                          // _ProfileStat(
                          //   label: 'Puntos',
                          //   value: '320',
                          //   color: cs.tertiary,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                l10n.fastAcces,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              QuickActionTile(
                icon: Icons.calendar_month,
                title: 'Mis reservas',
                subtitle: 'Consulta tus reservas activas y pasadas',
                color: cs.primary,
                onTap: () {},
              ),

              // const SizedBox(height: 12),
              // _QuickActionTile(
              //   icon: Icons.favorite,
              //   title: 'Favoritos',
              //   subtitle: '',
              //   color: cs.primary,
              //   onTap: () {},
              // ),
              const SizedBox(height: 12),

              QuickActionTile(
                icon: Icons.notifications,
                title: 'Alertas',
                subtitle: 'Controla notificaciones y recordatorios',
                color: cs.primary,
                onTap: () {},
              ),

              //Cajita que lleva a la pagina de ajustes
              const SizedBox(height: 32),
              //Filled , porque se quiere pintar la cajita
              FilledButton.icon(
                icon: const Icon(Icons.settings),
                label: Text(l10n.preferences),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PreferencesPage(),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              //y outlined porque queremos que nos pinte solo el texto y el border
              OutlinedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text('Cerrar sesión'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  foregroundColor: cs.error,
                  side: BorderSide(color: cs.error),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
