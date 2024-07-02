import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:parking/models/login_api_model.dart';

class ReservationApiModel {
  static final storage = FlutterSecureStorage();

  static Future<Map<String, dynamic>> reserveSlot() async {
    String? token = await LoginApiModel.getToken();
    if (token == null) {
      print('Token not found. Please login first.');
      return {'success': false, 'code': null};
    }

    final url = Uri.parse('https://cse-parking.up.railway.app/api/reserve/');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Cookie': 'jwt=$token', // Set the JWT token in the Cookie header
      },
    );

    if (response.statusCode == 201) {
      // Reservation successful, parse the response to get the reservation code
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String reservationCode = responseData['reservation_code'];
      print('Reservation successful. Code: $reservationCode');
      return {'success': true, 'code': reservationCode};
    } else {
      // Reservation failed
      print('Failed to reserve slot. Status code: ${response.statusCode}');
      return {'success': false, 'code': null};
    }
  }
}
