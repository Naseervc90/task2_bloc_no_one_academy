import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future<dynamic> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data:--- ${response.statusCode}--');
    }
  }
}
