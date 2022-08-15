import 'package:flutter/material.dart';

void main() {
  runApp(const LUP());
}

class LUP extends StatelessWidget {
  const LUP({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level Up Toast',
      theme: ThemeData(),

    );
  }
}
