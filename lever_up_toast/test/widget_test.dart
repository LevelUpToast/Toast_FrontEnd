// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/src/test_compat.dart';
import 'package:lever_up_toast/API/api.dart';
import 'package:lever_up_toast/main.dart';
import 'package:lever_up_toast/screens/introScreen.dart';


void main() {

  group("api", (){
    var api = new Api();
    var result;

    test("login", ()async{
      Map<String, dynamic> data = {
        'id': 'saac',
        'pw': 'saac'
      };
      result = await api.loginAPI(data);
      if (result == 1){
        print(api.getToken());
      };
    });

    test("main page", ()async{
    result = await api.mainPageApi();
    print("\n");
    print(result);
    });
    test("search", ()async{
      result =await api.searchApi("망고");
      print("\n" );
      print(result);
    });
  });

  // by sac
  testWidgets('LUP',(WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const IntroScreen());
    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
