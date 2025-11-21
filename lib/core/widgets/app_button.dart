import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:respi/features/bookingADD/presentation/pages/addBooking_page.dart';

// ignore: camel_case_types
class AppButton extends ConsumerWidget {
  final String text;
  final double radius;
  // Permite pasar una función onPressed opcional
  final VoidCallback? onPressed;

  const AppButton({
    super.key,
    required this.text,
    required this.radius,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return SizedBox(
      width: 350,
      height: 36,
      child: ElevatedButton(
        onPressed:
            // Aqui se usa la función onPressed si se proporciona, de lo contrario navega a AddbookingPage
            onPressed ??
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddbookingPage()),
              );
            },
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
