import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
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
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(starterIcon, color: Colors.black),
        onPressed: () {
          if (function != null) {
            function!();
          }
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
