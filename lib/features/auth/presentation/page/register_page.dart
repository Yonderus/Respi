import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:respi/core/l10n/app_localizations.dart';
import 'package:respi/core/widgets/app_text_field.dart';
import 'package:respi/core/widgets/app_title_text.dart';
import 'package:intl/intl.dart';
import 'package:respi/features/auth/presentation/page/home_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                        "Register to continue",
                        style: TextStyle(
                          fontSize: 14,
                          color: cs.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: 20),

                      app_text_field(
                        ' Email',
                        Icons.email,
                        false,
                        fillColor: cs.secondary,
                        iconColor: cs.primary,
                        textColor: cs.onSurface,
                        borderColor: cs.inverseSurface,
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        'Name',
                        Icons.supervised_user_circle,
                        false,
                        fillColor: cs.secondary,
                        iconColor: cs.primary,
                        textColor: cs.onSurface,
                        borderColor: cs.inverseSurface,
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        'Surname',
                        Icons.supervised_user_circle_outlined,
                        false,
                        fillColor: cs.secondary,
                        iconColor: cs.primary,
                        textColor: cs.onSurface,
                        borderColor: cs.inverseSurface,
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        'Locality',
                        Icons.location_on_outlined,
                        false,
                        fillColor: cs.secondary,
                        iconColor: cs.primary,
                        textColor: cs.onSurface,
                        borderColor: cs.inverseSurface,
                      ),

                      const SizedBox(height: 12),

                      // Campo de fecha de nacimiento
                      TextField(
                        controller: dateController,
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
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000),
                            firstDate: DateTime(1930),
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            String formattedDate = DateFormat(
                              'dd/MM/yyyy',
                            ).format(pickedDate);
                            dateController.text = formattedDate;
                          }
                        },
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        'Phone',
                        Icons.phone,
                        false,
                        fillColor: cs.secondary,
                        iconColor: cs.primary,
                        textColor: cs.onSurface,
                        borderColor: cs.inverseSurface,
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        ' Password',
                        Icons.lock,
                        true,
                        fillColor: cs.secondary,
                        iconColor: cs.primary,
                        textColor: cs.onSurface,
                        borderColor: cs.inverseSurface,
                      ),

                      const SizedBox(height: 25),

                      //Botón de crear cuenta
                      SizedBox(
                        width: 270,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
