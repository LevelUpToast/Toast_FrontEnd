import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:lever_up_toast/API/apiInfo.dart';

class Api with ChangeNotifier{

  void loginAPI(Map<String, dynamic> data, BuildContext context)async{
    print(data);
    HttpClientResponse response;
    Uri loginUrl = Uri.parse(ApiInfo.url + ApiInfo.loginUrl);
    print(loginUrl);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(loginUrl);
    request.headers.set(
        HttpHeaders.contentTypeHeader, "application/json");
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
    if(response.statusCode==200){
      response.listen((event) {
        Map temp = json.decode(utf8.decode(String.fromCharCodes(event).codeUnits));
        print(temp);
        Navigator.pushReplacementNamed(context, '/home');
      });
    }else{
      print("실패");
    }
  }
}