import 'package:flutter/material.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/widgets/app_noti_button.dart';
import 'package:respi/catalog/widgets/app_snackbar.dart';

class DemoCommunication extends StatelessWidget {
  const DemoCommunication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(texto: "Comunicación", flecha: true),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          AppNotiButton(count: 3),
          SizedBox(width: 20),
          AppSnackbar(
            textBar: 'Mensaje de SnackBar',
            textButton: 'Boton SnackBar',
          ),
        ],
      ),
    );
  }
}
