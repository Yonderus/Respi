import 'package:flutter/material.dart';
import 'package:respi/core/widgets/app_text_field.dart';
import 'package:respi/core/widgets/app_title_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            center: Alignment.topLeft,
            startAngle: -7.0,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 91, 91, 91),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🖼 Logo superior
              Image.asset(
                'lib/assets/images/Respi_Image_1.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 30),

              // 🟫 Contenedor principal
              Container(
                padding: const EdgeInsets.all(40),
                width: 340,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 72, 72, 72),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                // 📋 Contenido del login
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppTitleText(text: "Bienvenido a ResPi"),
                    const SizedBox(height: 6),
                    const Text(
                      "Sign in to continue",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(height: 20),

                    // 🔘 Botón Google
                    SizedBox(
                      width: 270,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          elevation: 3,
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Image.asset(
                                'lib/assets/images/logoGoogle.png',
                                width: 20,
                                height: 20,
                              ),
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Continue with Google",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // 🧩 Separador
                    const Text(
                      "--------------- OR ---------------",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(height: 15),

                    // 📧 Campos de texto
                    app_text_field(' Email', Icons.email),

                    const SizedBox(height: 12),

                    app_text_field(' Password', Icons.lock),

                    const SizedBox(height: 25),

                    // 🟢 Botón de Sign In
                    SizedBox(
                      width: 270,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDDF864),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
