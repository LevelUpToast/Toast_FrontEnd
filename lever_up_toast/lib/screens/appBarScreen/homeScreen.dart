// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lever_up_toast/screens/bodyScreen/mainScreen.dart';
import 'package:lever_up_toast/values/values.dart';

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
    const MainScreen(),
    const MainScreen(),
    const MainScreen()

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _bodyScreens[_selectedScreenIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 2),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            unselectedItemColor: AppColors.grey,
            selectedItemColor:  AppColors.blue,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child:  Icon(
                    Icons.home,
                    size: Sizes.TEXT_SIZE_28,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child:  Icon(
                    Icons.search,
                    size: Sizes.TEXT_SIZE_28,
                  ),
                ),
                label: '검색',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child:  Icon(
                    Icons.favorite,
                    size: Sizes.TEXT_SIZE_28,
                  ),
                ),
                label: '찜목록',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child:  Icon(
                    Icons.account_circle_rounded,
                    size: Sizes.TEXT_SIZE_28,
                  ),
                ),
                label: '마이페이지',
              ),
            ],
            onTap: _onItemTapped,
            currentIndex: _selectedScreenIndex,
          ),
        ),
      ),
    );
  }
}
