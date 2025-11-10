import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import '../providers/preferences_provider.dart';

class LanguageCard extends StatelessWidget {
  final AppLanguage language;
  final AppLocalizations l10n;
  final WidgetRef ref;

  const LanguageCard({
    super.key,
    required this.language,
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
        leading: const Icon(Icons.language),
        textColor: cs.onSurface,
        title: Text(l10n.language),
        trailing: DropdownButton<AppLanguage>(
          value: language,
          underline: const SizedBox(),
          items: AppLanguage.values.map((lang) {
            return DropdownMenuItem(
              value: lang,
              child: Text(lang.name.toUpperCase()),
            );
          }).toList(),
          onChanged: (v) {
            //Si el idioma seleccionado no es igual a null , lo pasamos al provider
            if (v != null) {
              ref.read(languageProvider.notifier).setLanguage(v);
            }
          },
        ),
      ),
    );
  }
}
