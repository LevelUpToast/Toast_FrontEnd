import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:toast_front/api/api_info.dart';

class Api{
  Map<String, String> body = {};
  final url  = Api_info.url;
  static String? id;
  static String? pw;
  var response;
  Map<String, dynamic> result = {};

  Future<dynamic> getLoginAuth(String id, String pw) async {
    body = {'id': id, 'pw': pw};
    try {
      response = await http
          .post(Uri.parse('$url/login'), body:convert.jsonEncode(body))
          .timeout(const Duration(seconds: 3));
      print(response);
      result = response;
    } catch (Exception) {
      result = {'result': false, 'err': 'server error'};
    }
    return response;
  }
}
