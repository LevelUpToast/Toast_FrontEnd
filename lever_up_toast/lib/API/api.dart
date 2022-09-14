import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:lever_up_toast/API/apiInfo.dart';
import 'package:lever_up_toast/screens/Login/membershipScreen.dart';
import 'package:lever_up_toast/values/values.dart';

class Api with ChangeNotifier {
  static String token = '';
  static String email = '';
  bool checkmembership = false;
  bool checklog = false;

  // 회원가입 세션
  void requestEmailAuth(String _email) async {
    email = _email;
    HttpClientResponse response;
    Uri membershipUrl = Uri.parse(ApiInfo.url + ApiInfo.membershipUrl + email);
    print(membershipUrl);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(membershipUrl);
    request.headers.set(HttpHeaders.contentTypeHeader, "application/json");
    request.headers.set(
      HttpHeaders.acceptHeader,
      'application/json',
    );
    request.headers.set(
      HttpHeaders.acceptCharsetHeader,
      'utf-8',
    );
    response = await request.close();
    if (response.statusCode == 200) {
      checkmembership= true;
      print("성공");
    } else {
      print("실패");
    }
    notifyListeners();
  }

  void confirmEmailAuth(String _code) async {
    HttpClientResponse response;
    Uri membershipUrl =
        Uri.parse(ApiInfo.url + ApiInfo.membershipUrl + email + '/' + _code);
    print(membershipUrl);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(membershipUrl);
    request.headers.set(HttpHeaders.contentTypeHeader, "application/json");
    request.headers.set(
      HttpHeaders.acceptHeader,
      'application/json',
    );
    request.headers.set(
      HttpHeaders.acceptCharsetHeader,
      'utf-8',
    );
    response = await request.close();
    if (response.statusCode == 200) {
      response.listen((event) {
        Map temp =
            json.decode(utf8.decode(String.fromCharCodes(event).codeUnits));
        StringConst.email_message = temp['message'];
        if(temp['detailCode'] == -1){
          checkmembership = true;
          checklog = true;
          notifyListeners();
        }else{
          checkmembership = false;
          notifyListeners();
        }
      });
    } else {
      print("실패");
    }
  }

  bool getBoolMember() {
    return checkmembership;
  }

  // 로그인 세션
  void loginAPI(Map<String, dynamic> data, BuildContext context) async {
    print(data);
    HttpClientResponse response;
    Uri loginUrl = Uri.parse(ApiInfo.url + ApiInfo.loginUrl);
    print(loginUrl);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(loginUrl);
    request.headers.set(HttpHeaders.contentTypeHeader, "application/json");
    request.headers.set(
      HttpHeaders.acceptHeader,
      'application/json',
    );
    request.headers.set(
      HttpHeaders.acceptCharsetHeader,
      'utf-8',
    );
    request.add(utf8.encode(json.encode(data)));
    response = await request.close();
    if (response.statusCode == 200) {
      response.listen((event) {
        Map temp =
            json.decode(utf8.decode(String.fromCharCodes(event).codeUnits));
        print(temp);
        token = temp['data']['token'];
        print(token);
        Navigator.pushReplacementNamed(context, '/home');
      });
    } else {
      print("실패");
    }
  }
}
