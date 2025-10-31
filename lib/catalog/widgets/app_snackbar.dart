import 'package:flutter/material.dart';

class AppSnackbar extends StatelessWidget {
  final String textBar;
  final String textButton;

  const AppSnackbar({
    super.key,
    required this.textBar,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text(textBar),
            //action: SnackBarAction(label: 'Undo', onPressed: () {}),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },

        child: Text(textButton),
      ),
    );
  }
}
