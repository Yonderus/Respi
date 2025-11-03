import 'package:flutter/material.dart';
import 'package:respi/catalog/widgets/app_bar_widget.dart';
import 'package:respi/core/widgets/app_bottomBar.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(texto: 'Reservar Pistas'),
      bottomNavigationBar: AppBottombar(),
    );
  }
}
