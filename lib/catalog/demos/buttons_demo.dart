import 'package:flutter/material.dart';

class DemoButtons extends StatelessWidget {
  static Widget demoButton(String text) {
    return ElevatedButton(
      onPressed: () => print('$text pressed'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
