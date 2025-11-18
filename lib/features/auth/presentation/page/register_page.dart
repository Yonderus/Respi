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
                        l10n.registerToContinue,
                        style: TextStyle(
                          fontSize: 14,
                          color: cs.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: 20),

                      app_text_field(
                        l10n.email,
                        Icons.email,
                        false,
                        fillColor: cs.secondary,
                        iconColor: cs.primary,
                        textColor: cs.onSurface,
                        borderColor: cs.inverseSurface,
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        l10n.name,
                        Icons.supervised_user_circle,
                        false,
                        fillColor: cs.secondary,
                        iconColor: cs.primary,
                        textColor: cs.onSurface,
                        borderColor: cs.inverseSurface,
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        l10n.surname,
                        Icons.supervised_user_circle_outlined,
                        false,
                        fillColor: cs.secondary,
                        iconColor: cs.primary,
                        textColor: cs.onSurface,
                        borderColor: cs.inverseSurface,
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        l10n.city,
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
                        l10n.phone,
                        Icons.phone,
                        false,
                        fillColor: cs.secondary,
                        iconColor: cs.primary,
                        textColor: cs.onSurface,
                        borderColor: cs.inverseSurface,
                      ),

                      const SizedBox(height: 12),

                      app_text_field(
                        l10n.password,
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
