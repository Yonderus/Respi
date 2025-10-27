import 'package:flutter/material.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/widgets/app_button_access.dart';
import 'package:respi/features/auth/presentation/page/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(texto: '¡Bienvendio a Respi!'),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFFFFF)),

        child: Column(
          children: [
            //TEXTO DE ACCESO RAPIDO
            Container(
              margin: const EdgeInsets.only(left: 40, top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Acceso Rápido',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //Botones de ACCESO RAPIDO
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 40)),

                AppButtonAccess(
                  text: 'Reserva nueva',
                  icon: Icons.calendar_today,
                  function: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                Padding(padding: EdgeInsets.only(left: 40)),
                AppButtonAccess(
                  text: 'Unirse',
                  icon: Icons.visibility,
                  function: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            ),
            //TEXTO DE PRÓXIMAS RESERVAS
            Container(
              margin: const EdgeInsets.only(left: 40, top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Próximas Reservas',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
