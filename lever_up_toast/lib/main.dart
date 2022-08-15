import 'package:flutter/material.dart';
import 'package:lever_up_toast/screens/introscreen.dart';

void main() {
  runApp(const LUP());
}

class LUP extends StatelessWidget {
  const LUP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level Up Toast',
      theme: ThemeData(),
      initialRoute: '/intro',
      routes: {
        '/intro' : (context) => IntroScreen(),
      },
    );
  }
}
