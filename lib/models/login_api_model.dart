import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginApiModel {
  static Future<bool> login(String email, String password) async {
    final url = Uri.parse('https://cse-parking.up.railway.app/api/login/');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return true; // login successful
    } else {
      return false; // login failed
    }
  }
}
