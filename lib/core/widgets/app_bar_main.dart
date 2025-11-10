import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/providers/bottom_nav_provider.dart';

class AppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  final String texto;
  final IconData? starterIcon;
  final IconData? finalIcon;
  final Function()? function;

  const AppBarWidget({
    super.key,
    required this.texto,
    this.starterIcon,
    this.finalIcon,
    this.function,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      leading: IconButton(
        icon: Icon(starterIcon, color: Colors.black),
        onPressed: () {
          // update provider state first, then navigate
          ref.read(bottomNavIndexProvider.notifier).state = 1;
        }, //=> Navigator.maybePop(context),
      ),
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 192, 192, 192), // color izquierdo
              Color(0xFF2E2E2E), // color derecho (más oscuro o claro)
            ],
          ),
        ),
      ),
      title: Text(texto),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
