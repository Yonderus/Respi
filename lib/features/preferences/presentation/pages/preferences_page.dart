import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import '../providers/preferences_provider.dart';
import '../widgets/theme_card.dart';
import '../widgets/language_card.dart';

class PreferencesPage extends ConsumerWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = ref.watch(themeModeProvider);
    final language = ref.watch(languageProvider);

    return Scaffold(
      //Pagina 3 es para que te lleva a la pagina tres del bottomnavbar
      //que seria la poagina del perfil
      appBar: AppBarWidget(texto: l10n.preferences, flecha: true, pagina: 3),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            //llamamos al widget de la card darkmode de la carpeta widgets
            //de los ajustes
            ThemeCard(isDark: isDark, l10n: l10n, ref: ref),

            const SizedBox(height: 10),
            //llamamos al widget de la card idioma de la carpeta widgets
            //de los ajustes
            LanguageCard(language: language, l10n: l10n, ref: ref),

            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
