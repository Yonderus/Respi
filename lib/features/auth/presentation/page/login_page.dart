import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_text_field.dart';
import 'package:respi/core/widgets/app_title_text.dart';
import 'package:respi/features/auth/controllers/auth_controller.dart';
import 'package:respi/features/auth/presentation/page/home_page.dart';
import 'package:respi/features/auth/presentation/page/register_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _userCtrl = TextEditingController(text: 'emilys');
  final _passCtrl = TextEditingController(text: 'emilyspass');
  // bool _obscure = true;
  bool _loading = false;

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_userCtrl.text.trim().isEmpty || _passCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, introduce usuario y contraseña'),
        ),
      );
      return;
    }
    setState(() => _loading = true);

    try {
      await ref
          .read(authControllerProvider.notifier)
          .signIn(email: _userCtrl.text.trim(), password: _passCtrl.text);
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login fallido: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
              // Logo superior
              Image.asset(
                'lib/assets/images/Respi_Image_1.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 30),

              // Contenedor principal
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
                child: Form(
                  key: _formKey,
                  // Contenido del login
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppTitleText(
                        text: l10n.welcomeRespi /*"Bienvenido a ResPi"*/,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        l10n.signinContinue,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(height: 20),

                      // Botón Google
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
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  l10n.continueGoogle,
                                  /*"Continue with Google"*/
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Separador
                      Text(
                        "--------------- ${l10n.or} ---------------",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(height: 15),

                      // Campos de texto
                      app_text_field(
                        l10n.email /*' Email'*/,
                        Icons.email,
                        false,
                        controller: _userCtrl,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Tienes que introducir un email";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        l10n.password /*' Password'*/,
                        Icons.lock,
                        true,
                        controller: _passCtrl,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Tienes que introducir una contraseña";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 25),

                      // Botón de Sign In
                      SizedBox(
                        width: 270,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: _loading ? null : _submit,

                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFDDF864),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            l10n.signin,
                            /*"Sign In"*/
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      //Botón de crear cuenta
                      SizedBox(
                        width: 270,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFDDF864),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Create Account",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
