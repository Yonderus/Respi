import 'package:flutter/material.dart';

class AppNotiButton extends StatelessWidget {
  final int count;

  const AppNotiButton({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Badge.count(count: count, child: const Icon(Icons.notifications)),
      onPressed: () {},
    );
  }
}
