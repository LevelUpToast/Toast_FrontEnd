import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lever_up_toast/API/apiInfo.dart';
import 'package:lever_up_toast/main.dart';
import 'package:lever_up_toast/screens/Login/membershipScreen.dart';
import 'package:lever_up_toast/values/values.dart';

class Api with ChangeNotifier {
  String? token = null;
  static String email = '';
  bool checkmembership = false;
  bool checklog = false;
  Uri uri = null as Uri;
  Map<String, dynamic> result = {};
  static Map<String, dynamic> productData = {};
  late HttpClientResponse response;

  // 회원가입 세션
  void setToken(String _token) {
    token = _token;
  }

  String? getToken() {
    return token;
  }

  void requestEmailAuth(String _email) async {
    email = _email;
    HttpClientResponse response;
    uri = Uri.parse(ApiInfo.url + ApiInfo.membershipUrl + email);
    print(uri);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(uri);
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
      checkmembership = true;
      print("성공");
    } else {
      print("실패");
    }
    notifyListeners();
  }

  void confirmEmailAuth(String _code) async {
    HttpClientResponse response;
    uri = Uri.parse(ApiInfo.url + ApiInfo.membershipUrl + email + '/' + _code);
    print(uri);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(uri);
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
        if (temp['detailCode'] == -1) {
          checkmembership = true;
          checklog = true;
          notifyListeners();
        } else {
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

  void signUp(Map<String, dynamic> data) async {
    HttpClientResponse response;
    uri = Uri.parse(ApiInfo.url + ApiInfo.signUpUrl);
    print(uri);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(uri);
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
    HttpClientResponse _response;
    Map<String, dynamic> temp = {};
    uri = Uri.parse(ApiInfo.testUrl + ApiInfo.loginUrl);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(uri);
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
    _response = await request.close().timeout(const Duration(seconds: 5));
    if (_response.statusCode == 200) {
      await _response.listen((event) {
        temp = json.decode(utf8.decode(String.fromCharCodes(event).codeUnits));
        result = 1; // succes
      });
    } else {
      print("실패");
    }
    setToken(temp['data']['token']);
    return result;
  }

  Future<Map<String, dynamic>> mainPageApi() async {
    HttpClientResponse _response;
    Map<String, dynamic> temp = {};
    Uri mainPageUrl;
    String? _token = getToken();
    // _token == null ? mainPageUrl = Uri.parse(ApiInfo.url + ApiInfo.mainUrl):
    // mainPageUrl = Uri.parse(ApiInfo.url + ApiInfo.mainUrl + _token);

    uri = Uri.parse(ApiInfo.testUrl + ApiInfo.mainUrl);
    print(uri);

    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(uri);
    request.headers.set(HttpHeaders.contentTypeHeader, "application/json");
    request.headers.set(
      HttpHeaders.acceptHeader,
      'application/json',
    );
    request.headers.set(
      HttpHeaders.acceptCharsetHeader,
      'utf-8',
    );
    _response = await request.close().timeout(const Duration(seconds: 5));

    if (_response.statusCode == 200) {
      await _response.listen((event) {
        temp = json.decode(utf8.decode(String.fromCharCodes(event).codeUnits));
        result = temp;
        //print(temp['data']['bannerImgUrl']);
      });
    } else {
      print("실패");
    }
    return result;
  }

  // Future<dynamic> imageApi(String image) async{
  //   HttpClientResponse _response;
  //   var _result;
  //   uri = Uri.parse(ApiInfo.testUrl + ApiInfo.imageUrl + image);
  //   print(uri);
  //   HttpClient httpClient = HttpClient();
  //   HttpClientRequest request = await httpClient.getUrl(uri);
  //   request.headers.set(HttpHeaders.contentTypeHeader, "image/png");
  //   request.headers.set(
  //     HttpHeaders.acceptHeader,
  //     'image/png',
  //   );
  //   request.headers.set(
  //     HttpHeaders.acceptCharsetHeader,
  //     'utf-8',
  //   );
  //   _response = await request.close().timeout(const Duration(seconds: 3));
  //
  // try {
  //   if (_response.statusCode == 200) {
  //     await _response.listen((event) {
  //       _result = event;
  //     });
  //   } else {
  //     print("실패");
  //   }
  // }
  // catch(e){
  //   print(e);
  // }
  //   return _result;
  // }

  Future<Map<String, dynamic>> searchApi(String keyWord) async {
    print(keyWord);
    String a = ApiInfo.url + ApiInfo.searchUrl + "1/" + keyWord;
    print(a);
    uri = Uri.parse(a);
    print(uri);
    HttpClientResponse _response;
    HttpClient httpClient = HttpClient();
    Map<String, dynamic> temp = {};

    HttpClientRequest request = await httpClient.getUrl(uri);
    request.headers.set(HttpHeaders.contentTypeHeader, "application/json");
    request.headers.set(
      HttpHeaders.acceptHeader,
      'application/json',
    );
    request.headers.set(
      HttpHeaders.acceptCharsetHeader,
      'utf-8',
    );
    _response = await request.close().timeout(const Duration(seconds: 5));
    if (_response.statusCode == 200) {
      await _response.listen((event) {
        temp = json.decode(utf8.decode(String.fromCharCodes(event).codeUnits));
        result = temp;
      });
    } else {
      print("실패");
    }

    return result;
  }

  Future<Image> bytesToImage(Uint8List imgBytes) async {
    String image = "3787d445-1a6d-4f16-8ddb-84d4d5bf89ad.png";
    var codec = await instantiateImageCodec(imgBytes);
    FrameInfo frame = await codec.getNextFrame();
    return frame.image as Image;
  }

  Future<int> productDetail(int _productSep) async {
    int result = 0;
    HttpClientResponse _response;
    uri =
        Uri.parse(ApiInfo.url + ApiInfo.productUrl+ _productSep.toString());
    print(uri);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(uri);
    request.headers.set(HttpHeaders.contentTypeHeader, "application/json");
    request.headers.set(
      HttpHeaders.acceptHeader,
      'application/json',
    );
    request.headers.set(
      HttpHeaders.acceptCharsetHeader,
      'utf-8',
    );
    _response = await request.close();
    if (_response.statusCode == 200) {
      _response.listen((event) {
        productData = json.decode(utf8.decode(String.fromCharCodes(event).codeUnits));
        print(productData);
      });
    } else {
      print("실패");
    }
    return 0;
  }

}
