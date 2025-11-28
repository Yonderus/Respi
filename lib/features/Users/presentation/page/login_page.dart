import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_button.dart';
import 'package:respi/core/widgets/app_text_field.dart';
import 'package:respi/core/widgets/app_title_text.dart';
import 'package:respi/features/Users/providers/auth_providers.dart';
import 'package:respi/features/auth/presentation/page/main_scaffold.dart';
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
      resizeToAvoidBottomInset:
          true, //Mueve el contenido hacia arriba cuando aparece el teclado (evita overflow)
      body: SafeArea(
        child: SingleChildScrollView(
          // Permite desplazar el contenido y evita overflow cuando aparece el teclado
          padding: const EdgeInsets.only(bottom: 20),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // 👈 IMPORTANTE
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppTitleText(
                          color: cs.primary,
                          text: l10n.welcomeRespi,
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

                        Row(
                          children: [
                            Expanded(child: Divider()),
                            const SizedBox(width: 5),
                            Text(
                              l10n.or,
                              style: TextStyle(
                                fontSize: 14,
                                color: cs.onSecondary,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(child: Divider()),
                          ],
                        ),

                        const SizedBox(height: 15),

                        AppTextField(
                          label: l10n.email,
                          icon: Icons.email,
                          obscureText: false,
                          controller: _emailCtrl,
                          validator: (v) {
                            if (v == null || v.isEmpty) return l10n.enterEmail;
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
                            if (v == null || v.isEmpty)
                              return l10n.enterPassword;
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

                        AppButton(
                          text: l10n.createAccount,
                          textVariant: AppButtonTextVariant.primaryBold,
                          radius: 8,
                          height: 40,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => RegisterPage()),
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
        ),
      ),
    );
  }
}
