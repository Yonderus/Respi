import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_text_field.dart';
import 'package:respi/core/widgets/app_title_text.dart';
import 'package:respi/features/Users/providers/auth_providers.dart';
import 'package:respi/features/auth/presentation/page/home_page.dart';
import 'package:respi/features/Users/presentation/page/register_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    final auth = ref.read(authProvider.notifier);

    final error = await auth.login(
      _emailCtrl.text.trim(),
      _passCtrl.text.trim(),
    );

    if (error != null && mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
    } else {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      }
    }

    if (mounted) setState(() => _loading = false);
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
          children: [
            Image.asset(
              'lib/assets/images/Respi_Image_1.png',
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(40),
              width: 340,
              decoration: BoxDecoration(
                color: cs.surface,
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
                child: Column(
                  children: [
                    AppTitleText(color: cs.primary, text: l10n.welcomeRespi),
                    const SizedBox(height: 6),
                    Text(
                      l10n.signinContinue,
                      style: TextStyle(fontSize: 14, color: cs.onSurface),
                    ),
                    const SizedBox(height: 20),

                    app_text_field(
                      l10n.email,
                      Icons.email,
                      false,
                      controller: _emailCtrl,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Tienes que introducir un email";
                        }
                        return null;
                      },
                      fillColor: cs.surfaceVariant,
                      iconColor: cs.primary,
                      textColor: cs.onSurface,
                      borderColor: cs.inverseSurface,
                    ),

                    const SizedBox(height: 12),

                    app_text_field(
                      l10n.password,
                      Icons.lock,
                      true,
                      controller: _passCtrl,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Tienes que introducir una contraseña";
                        }
                        return null;
                      },
                      fillColor: cs.surfaceVariant,
                      iconColor: cs.primary,
                      textColor: cs.onSurface,
                      borderColor: cs.inverseSurface,
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: 270,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: _loading ? null : _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cs.primary,
                          foregroundColor: cs.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          l10n.signin,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: 270,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegisterPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cs.primary,
                          foregroundColor: cs.onPrimary,
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
    );
  }
}
