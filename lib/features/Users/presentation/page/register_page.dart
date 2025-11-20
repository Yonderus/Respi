import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
          child: SingleChildScrollView(
            child: Column(
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

                  child: Column(
                    children: [
                      const AppTitleText(text: "Bienvenido a ResPi"),
                      const SizedBox(height: 6),
                      const Text(
                        "Register to continue",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(height: 20),

                      app_text_field(
                        "Email",
                        Icons.email,
                        false,
                        controller: _emailCtrl,
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        "Name",
                        Icons.person,
                        false,
                        controller: _nameCtrl,
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        "Surname",
                        Icons.person_outline,
                        false,
                        controller: _surnameCtrl,
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        "Locality",
                        Icons.location_city,
                        false,
                        controller: _localityCtrl,
                      ),

                      const SizedBox(height: 12),

                      TextField(
                        controller: _birthCtrl,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 91, 91, 91),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
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

                      app_text_field(
                        "Phone",
                        Icons.phone,
                        false,
                        controller: _phoneCtrl,
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        "Password",
                        Icons.lock,
                        true,
                        controller: _passCtrl,
                      ),

                      const SizedBox(height: 25),

                      SizedBox(
                        width: 270,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: _register,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
