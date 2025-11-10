import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/catalog/catalog_page.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
//import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_bottomBar.dart';
import 'package:respi/features/preferences/presentation/pages/preferences_page.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    //final l10n = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Card(
          color: Colors.blue,

          child: ListTile(
            title: Text('Settings'),
            leading: const Icon(Icons.settings),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PreferencesPage()),
            ),
          ),
        ),

        //
        Card(
          elevation: 2,
          color: cs.surface,
          child: Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width,
              right: MediaQuery.of(context).size.width,
              top: 20,
              bottom: 20,
            ),

            child: Text("hola"), // title: Text('Settings'),
            // leading: const Icon(Icons.settings),
            // onTap: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => PreferencesPage()),
            // ),
          ),
        ),
      ],
    );

    // body: Container(
    //   decoration: BoxDecoration(color: Color.fromARGB(255, 209, 211, 204)),

    //   child: Column(
    //     children: [
    //       //TEXTO DE ACCESO RAPIDO
    //       Column(
    //         children: [
    //           Card(
    //             child: Title(color: Colors.red, child: Icon(Icons.abc)),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // ),
  }
}
