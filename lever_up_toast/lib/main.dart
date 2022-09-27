// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:lever_up_toast/app_theme.dart';
import 'package:lever_up_toast/screens/Login/loginScreen.dart';
import 'package:lever_up_toast/screens/Login/membershipScreen.dart';
import 'package:lever_up_toast/screens/appBarScreen/homeScreen.dart';
import 'package:lever_up_toast/screens/bodyScreen/productDetailScreen.dart';
import 'package:lever_up_toast/screens/bodyScreen/searchScreen.dart';
import 'package:lever_up_toast/screens/introScreen.dart';
import 'package:provider/provider.dart';
import 'package:lever_up_toast/API/api.dart';


void main() {
  runApp(const LUP());
}

class LUP extends StatelessWidget {
  const LUP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Api(),
        ),
      ],
      child: MaterialApp(
        title: 'Level Up Toast',
        theme: AppTheme.lightThemeData,
        initialRoute: '/intro',
        routes: {
          '/intro': (context) => const IntroScreen(),
          '/login': (context) => const LoginScreen(),
          '/home' : (context) => HomeScreen(),
          '/Membership': (context) => MembershipScreen(),
          '/search' : (context) => const searchScreen(),
          '/detail' : (context) => ProductDetailScreen(),

          //'/findSearch' : (context) =>findSearchScreen(),
        },
      ),
    );
  }
}
