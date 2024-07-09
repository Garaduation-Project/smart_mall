import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:parking/models/login_api_model.dart';

class DurationApiModel {
  static final storage = FlutterSecureStorage();

  static Future<Map<String, dynamic>> fetchDuration() async {
    String? token = await LoginApiModel.getToken();
    if (token == null) {
      print('Token not found. Please login first.');
      return {'success': false, 'durations': null};
    }

    final url = Uri.parse('https://cse-parking.up.railway.app/api/history/');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Cookie': 'jwt=$token', // to set the JWT token in the Cookie header
      },
    );

   if (e['exited_at'] == null) {
          return (e['duration'] as num).toDouble();
        } else {
          return (e['duration'] as num).toDouble();
        }
      }).toList();

      return {'success': true, 'durations': durations};
    } else {
      print('Failed to fetch durations. Status code: ${response.statusCode}');
      return {'success': false, 'durations': null};
    }
  }
}
