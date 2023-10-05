import 'dart:convert';

import 'package:auth_firebase/api/global_api.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<http.Response> login(String name, String password) async {
    Map data = {
      "name": name,
      "password": password,
    };

    var body = jsonEncode(data);
    var url = Uri.parse(baseUrl + 'login');
    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> logout() async {
    var url = Uri.parse(baseUrl + 'logout');
    http.Response response = await http.post(
      url,
      headers: header,
    );
    print(url);
    return response;
  }
}
