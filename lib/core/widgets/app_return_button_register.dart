import 'package:flutter/material.dart';
import 'package:respi/features/Users/presentation/page/login_page.dart';

class AppReturnButtonRegister extends StatelessWidget {
  const AppReturnButtonRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,

      child: TextButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        icon: Icon(Icons.arrow_back),
        label: Text("Volver atrás"),
      ),
    );
  }
}
