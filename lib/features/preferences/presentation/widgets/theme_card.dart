import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import '../providers/preferences_provider.dart';

class ThemeCard extends StatelessWidget {
  final bool isDark;
  final AppLocalizations l10n;
  final WidgetRef ref;

  const ThemeCard({
    super.key,
    required this.isDark,
    required this.l10n,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark
          ? const Color.fromARGB(245, 31, 15, 102)
          : const Color.fromARGB(255, 231, 231, 231),
      child: ListTile(
        leading: const Icon(Icons.nights_stay_rounded),
        title: Text(l10n.darkMode),
        trailing: Switch(
          value: isDark,
          onChanged: (v) => ref.read(themeModeProvider.notifier).setTheme(v),
          activeThumbColor: Colors.blue,
        ),
      ),
    );
  }
}
