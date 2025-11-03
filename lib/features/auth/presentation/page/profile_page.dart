import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
//import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_bottomBar.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBarWidget(texto: 'Perfil', flecha: true),
      bottomNavigationBar: AppBottombar(),

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
    );
  }
}
