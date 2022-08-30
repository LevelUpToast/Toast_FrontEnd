// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lever_up_toast/screens/bodyScreen/mainScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

/// 페이지 설명 작성 부탁
/// 1. 홈페이지
/// 2.
/// 3.
/// 4.


class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  // 네비게이션 스크린
  final List<Widget> _bodyScreens = [
    const MainScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _bodyScreens[_selectedScreenIndex],
    bottomNavigationBar: Container(),
    );
  }
}
