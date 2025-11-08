import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  final String texto;
  final bool flecha;

  const AppBarWidget({
    super.key,
    required this.texto,
    this.flecha = true, // valor por defecto
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return AppBar(
      automaticallyImplyLeading: false, // control manual del leading
      // Flecha de retroceso condicional

      // leading: flecha
      //     ? IconButton(
      //         icon: const Icon(
      //           Icons.arrow_back_ios_new,
      //           color: Color.fromARGB(255, 0, 0, 0),
      //         ),
      //         onPressed: () {
      //           ref.read(bottomNavIndexProvider.notifier).state = 0;
      //           Navigator.maybePop(context);
      //         },
      //       )
      //     : null,
      backgroundColor: cs.surface,

      title: Text(
        texto,
        style: TextStyle(
          color: cs.onSurface,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      elevation: 0,
    );
  }
}
