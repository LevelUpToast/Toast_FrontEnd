import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:toast_front/api/api_info.dart';

class Api{
  Map<String, String> body = {};
  final url  = Api_info.url;
  static String? id;
  static String? pw;
  String keyType = "";
  var response;
  Map<String, dynamic> result = {};

  Future<dynamic> getLoginAuth(String id, String pw) async {
    // try{
    //   body = {'id': id, 'pw': pw};
    //   HttpClient httpClient = new HttpClient();
    //   // ignore: close_sinks
    //   HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    //   request.headers.set("Content-type", "application/json");
    //   request.add(utf8.encode(convert.jsonEncode(body)));
    //   response = await response.close();
    //   print(response);
    // } catch(e){
    //   print(1);
    // }
    //


    try {
      response = await http
          .post(Uri.parse(url), body: jsonEncode(body.toString()));
      result = response;
      print(response);
    } catch (Exception) {
      result = {'result': false, 'err': 'server error'};
    }
    return response;
  }
}
