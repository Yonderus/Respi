import 'package:flutter/material.dart';
import 'package:respi/features/bookingADD/presentation/pages/addBooking_page.dart';

enum AppButtonTextVariant { primaryBold, blackBold }

class AppButtonTextStyle {
  final TextStyle textStyle;
  const AppButtonTextStyle({required this.textStyle});
}

AppButtonTextStyle getButtonTextStyle(
  AppButtonTextVariant variant,
  BuildContext context,
) {
  switch (variant) {
    case AppButtonTextVariant.primaryBold:
      return AppButtonTextStyle(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      );

    case AppButtonTextVariant.blackBold:
      return const AppButtonTextStyle(
        textStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      );
  }
}

// // ignore: camel_case_types
// class AppButton extends StatelessWidget {
//   final String text;
//   final double radius;
//   // Permite pasar una función onPressed opcional
//   final VoidCallback? onPressed;

//   const AppButton({
//     super.key,
//     required this.text,
//     required this.radius,
//     this.onPressed,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final cs = theme.colorScheme;

//     return SizedBox(
//       width: 350,
//       height: 36,
//       child: ElevatedButton(
//         onPressed:
//             // Aqui se usa la función onPressed si se proporciona, de lo contrario navega a AddbookingPage
//             onPressed ??
//             () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const AddbookingPage()),
//               );
//             },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: cs.primary,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(radius),
//           ),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//       ),
//     );
//   }
// }

class AppButton extends StatelessWidget {
  final String text;
  final double radius;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final AppButtonTextVariant textVariant;

  const AppButton({
    super.key,
    required this.text,
    required this.radius,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 36,
    this.textVariant = AppButtonTextVariant.blackBold,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textStyle = getButtonTextStyle(textVariant, context);

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(text, style: textStyle.textStyle),
      ),
    );
  }
}
