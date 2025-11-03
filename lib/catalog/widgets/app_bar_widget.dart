import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/providers/bottom_nav_provider.dart';

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
    return AppBar(
      automaticallyImplyLeading: false, // control manual del leading
      // Flecha de retroceso condicional
      leading: flecha
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: () {
                ref.read(bottomNavIndexProvider.notifier).state = 0;
                Navigator.maybePop(context);
              },
            )
          : null,

      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 192, 192, 192), // color izquierdo
              Color(0xFF2E2E2E), // color derecho
            ],
          ),
        ),
      ),

      title: Text(
        texto,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      elevation: 0,
    );
  }
}
