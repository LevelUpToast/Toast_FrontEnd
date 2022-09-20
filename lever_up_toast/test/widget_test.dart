// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/src/test_compat.dart';
import 'package:lever_up_toast/API/api.dart';


void main() {
  test("api", ()async{
    Map<String, dynamic> data = {
      'id': 'saac',
      'pw': 'saac'
    };
    var api = new Api();
    int result = await api.loginAPI(data);
    if (result == 1){
      print(api.getToken());
    };
  });

  test("image test", (){

  });

}
