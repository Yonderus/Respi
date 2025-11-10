import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/features/auth/presentation/page/login_page.dart';
import 'package:respi/features/preferences/presentation/providers/preferences_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeModeProvider);
    final language = ref.watch(languageProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // Ingles
        Locale('es'), // Español
        Locale('fr'), // Frances
        Locale('de'), // Aleman
      ],
      locale: language.locale,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: const LoginPage(),

      // routes: {
      //   '/DemoButtons': (_) => const DemoButtons(),
      //   '/login': (_) => const LoginPage(),
      //   '/HomePage': (_) => const HomePage(),
      // },
    );
  }
}
