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
    final isDark = ref.watch(themeModeProvider);

    return Card(
      color: isDark
          ? const Color.fromARGB(245, 31, 15, 102)
          : const Color.fromARGB(255, 231, 231, 231),
      child: ListTile(
        leading: const Icon(Icons.language),
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
            if (v != null) {
              ref.read(languageProvider.notifier).setLanguage(v);
            }
          },
        ),
      ),
    );
  }
}
