import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/l10n/join_translations.dart';
import 'package:respi/core/widgets/app_container_join.dart';
import 'package:respi/features/join/controllers/JoinController.dart';

class JoinPage extends ConsumerStatefulWidget {
  const JoinPage({super.key});

  @override
  ConsumerState<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends ConsumerState<JoinPage> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final asyncDatos = ref.watch(courtJoinProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),

        // Título
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '${t.selectCourt}:',
              style: TextStyle(
                color: cs.onSurface,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 15),

        // Lista de partidas
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
                    text: t.joinName(partida.text),
                    pricePerson: partida.pricePerson,
                    routeImage: partida.routeImage,
                    personasNecesarias: partida.personasNecesarias,
                    level: t.joinLevel(partida.level),
                  );
                },
              ),
              loading: () => Center(
                child: Image.asset('lib/assets/images/animacionCarga.gif'),
              ),
              error: (err, stack) => Center(
                child: Text('Error: $err', style: TextStyle(color: cs.error)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
