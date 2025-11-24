import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_return_button_register.dart';
import 'package:respi/core/widgets/app_text_field.dart';
import 'package:respi/core/widgets/app_title_text.dart';
import 'package:respi/features/Users/data/models/Users.dart';
import 'package:respi/features/Users/providers/auth_providers.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _emailCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _surnameCtrl = TextEditingController();
  final _localityCtrl = TextEditingController();
  final _birthCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _nameCtrl.dispose();
    _surnameCtrl.dispose();
    _localityCtrl.dispose();
    _birthCtrl.dispose();
    _phoneCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    // 1. Validar campos vacíos
    if (_emailCtrl.text.trim().isEmpty ||
        _nameCtrl.text.trim().isEmpty ||
        _surnameCtrl.text.trim().isEmpty ||
        _localityCtrl.text.trim().isEmpty ||
        _birthCtrl.text.trim().isEmpty ||
        _phoneCtrl.text.trim().isEmpty ||
        _passCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Todos los campos son obligatorios")),
      );
      return;
    }

    // 2. Validar formato de fecha de nacimiento
    DateTime? fechaNacimiento;

    try {
      fechaNacimiento = DateFormat('dd/MM/yyyy').parse(_birthCtrl.text.trim());
    } catch (_) {
      fechaNacimiento = null;
    }

    if (fechaNacimiento == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Selecciona una fecha de nacimiento válida"),
        ),
      );
      return;
    }

    // 3. Crear el usuario local
    final user = User(
      usuarioId: null,
      name: _nameCtrl.text.trim(),
      surname: _surnameCtrl.text.trim(),
      email: _emailCtrl.text.trim(),
      phone: _phoneCtrl.text.trim(),
      password: _passCtrl.text.trim(),
      role: UserRole.CLIENTE,
      isActive: true,
      fechaRegistro: DateTime.now(),
      fechaUltimoLogin: DateTime.now(),
      fechaNacimiento: fechaNacimiento,
      direccion: _localityCtrl.text.trim(),
    );

    // 4. Registrar llamando al AuthNotifier
    final auth = ref.read(authProvider.notifier);
    final error = await auth.register(user);

    if (error != null && mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      return;
    }

    // 5. Confirmación de creación exitosa
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cuenta creada correctamente")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final TextEditingController dateController = TextEditingController();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
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
                    color: cs.secondary,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: cs.onPrimary.withValues(alpha: 0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  // Contenido del login
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppTitleText(
                        text: l10n.welcomeRespi,
                        color: cs.onSecondary,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        l10n.registerToContinue,
                        style: TextStyle(
                          fontSize: 14,
                          color: cs.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: 20),

                      AppTextField(
                        controller: _emailCtrl,
                        label: l10n.email,
                        icon: Icons.email,
                        obscureText: false,
                      ),

                      const SizedBox(height: 12),

                      AppTextField(
                        controller: _nameCtrl,
                        label: l10n.name,
                        icon: Icons.supervised_user_circle,
                        obscureText: false,
                      ),

                      const SizedBox(height: 12),

                      AppTextField(
                        controller: _surnameCtrl,
                        label: l10n.surname,
                        icon: Icons.supervised_user_circle_outlined,
                        obscureText: false,
                      ),

                      const SizedBox(height: 12),

                      AppTextField(
                        controller: _localityCtrl,
                        label: l10n.city,
                        icon: Icons.location_on_outlined,
                        obscureText: false,
                      ),

                      const SizedBox(height: 12),

                      // Campo de fecha de nacimiento
                      TextField(
                        controller: _birthCtrl,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: l10n.dateBirth,
                          labelStyle: TextStyle(color: cs.onTertiary),
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: cs.onTertiary,
                          ),
                          filled: true,
                          fillColor: cs.tertiary,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: cs.onTertiary),
                        onTap: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000),
                            firstDate: DateTime(1930),
                            lastDate: DateTime.now(),
                          );
                          if (pickedDate != null) {
                            _birthCtrl.text = DateFormat(
                              'dd/MM/yyyy',
                            ).format(pickedDate);
                          }
                        },
                      ),

                      const SizedBox(height: 12),

                      AppTextField(
                        controller: _phoneCtrl,
                        label: l10n.phone,
                        icon: Icons.phone,
                        obscureText: false,
                      ),

                      const SizedBox(height: 12),

                      AppTextField(
                        controller: _passCtrl,
                        label: l10n.password,
                        icon: Icons.lock,
                        obscureText: true,
                      ),

                      const SizedBox(height: 25),

                      //Botón de crear cuenta
                      SizedBox(
                        width: 270,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: _register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: cs.primary,
                            foregroundColor: cs.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            l10n.createAccount,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),
                      AppReturnButtonRegister(),
                    ],
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
