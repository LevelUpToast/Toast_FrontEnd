import 'package:flutter/material.dart';
import 'package:lever_up_toast/app_theme.dart';
import 'package:lever_up_toast/screens/Login/loginScreen.dart';
import 'package:lever_up_toast/screens/introScreen.dart';

void main() {
  runApp(const LUP());
}

class LUP extends StatelessWidget {
  const LUP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level Up Toast',
      theme: AppTheme.lightThemeData,
      initialRoute: '/intro',
      routes: {
        '/intro' : (context) => IntroScreen(),
        '/login' : (context) => LoginScreen(),
      },
    );
  }
}
