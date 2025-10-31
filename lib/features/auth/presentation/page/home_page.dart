import 'package:flutter/material.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/widgets/app_bottomBar.dart';
import 'package:respi/core/widgets/app_button_access.dart';
import 'package:respi/core/widgets/app_container_booking.dart';
import 'package:respi/features/auth/presentation/page/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(texto: '¡Bienvendio a Respi!'),
      bottomNavigationBar: AppBottombar(),
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 209, 211, 204)),
        child: SingleChildScrollView(
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
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

              Column(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  app_container_booking(
                    route: 'lib/assets/images/basketball.png',
                    sport: 'Baloncesto',
                    data: '27/10/2025',
                    time: '18:30',
                    locate: 'Bocairent',
                  ),

                  Padding(padding: EdgeInsets.all(10)),
                  app_container_booking(
                    route: 'lib/assets/images/football.png',
                    sport: 'Fútbol',
                    data: '27/10/2025',
                    time: '18:30',
                    locate: 'Bocairent',
                  ),

                  Padding(padding: EdgeInsets.all(10)),
                  app_container_booking(
                    route: 'lib/assets/images/padel-racket.png',
                    sport: 'Pádel',
                    data: '27/10/2025',
                    time: '18:30',
                    locate: 'Bocairent',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
