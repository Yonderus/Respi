// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:respi/core/widgets/app_text_field.dart';
import 'package:respi/core/widgets/app_title_text.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      //   home: Scaffold(
      //     body: Center(
      //       child: Container(
      //         width: 340,
      //         height: 550,
      //         decoration: BoxDecoration(
      //           color: const Color.fromARGB(255, 72, 72, 72),
      //           borderRadius: BorderRadius.circular(16),
      //         ),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,

      //           children: [
      //             Image.asset(
      //               'lib/assets/images/Respi_Image.png',
      //               width: 200,
      //               height: 200,
      //             ),
      //             AppTitleText(text: "Bienvenido a ResPi"),

      //             Text(
      //               "Sign in to continue",
      //               style: TextStyle(fontSize: 14, color: Colors.white),
      //             ),

      //             const SizedBox(height: 10),

      //             SizedBox(
      //               width: 270,
      //               child: ElevatedButton(
      //                 onPressed: () {},
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor: Colors.white,
      //                   foregroundColor: Colors.black,
      //                   shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(8),
      //                   ),
      //                 ),
      //                 child: Text("Continue with Google"),
      //               ),
      //             ),

      //             SizedBox(height: 12),

      //             Text(
      //               "--------------- OR ---------------",
      //               style: TextStyle(fontSize: 14, color: Colors.white),
      //             ),

      //             SizedBox(height: 12),

      //             app_text_field('Email'),
      //             const SizedBox(height: 12),
      //             app_text_field('Password'),
      //             const SizedBox(height: 20),

      //             SizedBox(
      //               width: 270,
      //               height: 40,
      //               child: ElevatedButton(
      //                 onPressed: () {},
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor: Color(0xFFDDF864),
      //                   foregroundColor: Colors.black,
      //                   shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(8),
      //                   ),
      //                 ),
      //                 child: Text("Sign In"),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: SweepGradient(
          center: Alignment.topLeft,
          startAngle: 0.3,
          colors: [
            Color.fromARGB(255, 51, 51, 51),
            Color.fromARGB(255, 235, 232, 228),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Center(
          child: Column(
            children: [
              Image.asset(
                'lib/assets/images/Respi_imagen_2_.png',
                width: 100,
                height: 100,
              ),
              Container(
                width: 340,
                padding: EdgeInsets.all(30),

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 208, 207, 207),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    AppTitleText(text: "Bienvenido a ResPi"),

                    Text(
                      "Sign in to continue",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      width: 270,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),

                        child: Stack(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Image.asset(
                                'assets/images/logoGoogle.png',
                                width: 20,
                                height: 20,
                              ),
                            ),
                            // const SizedBox(width: 10),
                            Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "Continue with Google",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    Text(
                      "--------------- OR ---------------",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),

                    SizedBox(height: 12),

                    app_text_field('Email'),
                    const SizedBox(height: 12),
                    app_text_field('Password'),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: 270,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFDDF864),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text("Sign In"),
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
