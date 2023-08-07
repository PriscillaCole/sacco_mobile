// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = 'https://sacco.ugnews24.info/api';
  //if you are using android studio emulator, change localhost to 10.0.2.2
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? tokenString = localStorage.getString('token');
    token = tokenString != null ? jsonDecode(tokenString)['token'] : '';
  }

  Future<Response> authData(data, apiUrl) async {
    var fullUrl = Uri.parse(_url + apiUrl);

    // create a response with just and enpoint url in options
    Response response = Response('', 200);

    try {
      response = await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: _setHeaders(),
      );
    } catch (e) {
      print("Error $e"*5);
    }

    return response;
  }

  getData(apiUrl) async {
    var fullUrl = Uri.parse(_url + apiUrl);
    await _getToken();
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
