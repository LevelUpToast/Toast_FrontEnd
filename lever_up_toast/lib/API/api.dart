import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lever_up_toast/API/apiInfo.dart';
import 'package:lever_up_toast/screens/Login/membershipScreen.dart';
import 'package:lever_up_toast/values/values.dart';

class Api with ChangeNotifier {
  String token = '';
  static String email = '';
  bool checkmembership = false;
  bool checklog = false;

  // 회원가입 세션
  void setToken(String _token){
    token = _token;
  }
  String getToken(){
    return token;
  }
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

  void signUp(Map<String, dynamic> data) async{
    HttpClientResponse response;
    Uri signUpUrl = Uri.parse(ApiInfo.url + ApiInfo.signUpUrl);
    print(signUpUrl);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(signUpUrl);
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

        // Navigator.pushReplacementNamed(context, '/home');
      });
    } else {
      print("실패");
    }
  }

  // 로그인 세션
  Future<int> loginAPI(Map<String, dynamic> data) async {
    print(data);
    int result = 0;
    HttpClientResponse response;
    Map<String, dynamic>  temp = {};
    Uri loginUrl = Uri.parse(ApiInfo.url + ApiInfo.loginUrl);
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
    response = await request.close().timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      await response.listen((event) {
        temp =
            json.decode(utf8.decode(String.fromCharCodes(event).codeUnits));
        result = 1; // succes
      });
    } else {
      print("실패");
    }
    setToken(temp['data']['token']);
    return result;
  }
}
