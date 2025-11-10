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
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Card(
      color: cs.surface,
      child: ListTile(
        leading: const Icon(Icons.nights_stay_rounded),
        title: Text(l10n.darkMode),
        textColor: cs.onSurface,
        trailing: Switch(
          value: isDark,
          onChanged: (v) => ref.read(themeModeProvider.notifier).setTheme(v),
          activeThumbColor: Colors.blue,
        ),
      ),
    );
  }
}
