// parking_api.dart

import 'package:http/http.dart' as http;
import 'dart:convert';

class FreeSlotsApiModel {
  Future<Map<String, dynamic>> fetchFreeSlots() async {
    try {
      final response = await http
          .get(Uri.parse('https://cse-parking.up.railway.app/api/freeslots/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {'freeslots': data['freeslots']};
      } else {
        throw Exception('Failed to load free slots');
      }
    } catch (e) {
      throw Exception('Error fetching free slots: $e');
    }
  }
}
