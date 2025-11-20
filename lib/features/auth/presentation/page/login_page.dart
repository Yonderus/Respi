import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_button.dart';
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
    final l10n = AppLocalizations.of(context)!;

    if (_userCtrl.text.trim().isEmpty || _passCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.enterCredentials /*Por favor, introduce usuario y contraseña*/,
          ),
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
          SnackBar(content: Text('${l10n.loginFailed} : ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
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
                color: cs.surface,
                borderRadius: BorderRadius.circular(16),

                boxShadow: [
                  BoxShadow(
                    color: cs.onPrimary.withValues(alpha: 0.5),
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
                      color: cs.primary,
                      text: l10n.welcomeRespi /*"Bienvenido a ResPi"*/,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l10n.signinContinue,
                      style: TextStyle(fontSize: 14, color: cs.onSurface),
                    ),
                    const SizedBox(height: 20),

                    // Botón Google
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cs.onTertiary,
                          foregroundColor: cs.onPrimary,
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
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        const SizedBox(width: 5),
                        Text(
                          l10n.or,
                          style: TextStyle(fontSize: 14, color: cs.onSecondary),
                        ),
                        const SizedBox(width: 5),
                        Expanded(child: Divider()),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // Campos de texto
                    AppTextField(
                      label: l10n.email,
                      icon: Icons.email,
                      obscureText: false,
                      controller: _userCtrl,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return l10n.enterEmail;
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 12),

                    AppTextField(
                      label: l10n.password,
                      icon: Icons.lock,
                      obscureText: true,
                      controller: _passCtrl,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return l10n.enterPassword;
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 25),

                    AppButton(
                      text: l10n.signin,
                      textVariant: AppButtonTextVariant.primaryBold,
                      radius: 8,
                      height: 40,
                      onPressed: _loading ? null : _submit,
                    ),

                    const SizedBox(height: 12),

                    //Botón de crear cuenta
                    AppButton(
                      text: l10n.createAccount,
                      textVariant: AppButtonTextVariant.primaryBold,
                      radius: 8,
                      height: 40,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
