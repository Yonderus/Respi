import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_container_join.dart';
import 'package:respi/features/join/controllers/JoinController.dart';
import 'package:respi/features/join/data/repositories/CourtJoin_Repository.dart';

class JoinPage extends ConsumerStatefulWidget {
  const JoinPage({super.key});

  @override
  ConsumerState<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends ConsumerState<JoinPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final asyncDatos = ref.watch(courtJoinProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        // TÍTULO
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Selecione una partida:',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 15),

        // LISTA DE PARTIDAS
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: asyncDatos.when(
              data: (partidasList) => ListView.builder(
                itemCount: partidasList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final partida = partidasList[index];
                  return app_container_join(
                    text: partida.text,
                    pricePerson: partida.pricePerson,
                    routeImage: partida.routeImage,
                    personasNecesarias: partida.personasNecesarias,
                    level: partida.level,
                  );
                },
              ),
              loading: () => Center(
                child: Image.asset('lib/assets/images/animacionCarga.gif'),
              ),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ),
      ],
    );
  }
}


// return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: 20),

//           for (var partida in partidas)
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10.0),
//               child: app_container_join(
//                 text: partida['text'],
//                 pricePerson: partida['pricePerson'],
//                 routeImage: partida['routeImage'],
//                 personasNecesarias: partida['personasNecesarias'],
//                 level: partida['level'],
//               ),
//             ),
//         ],
//       ),
//     );