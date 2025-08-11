import 'dart:convert';
import 'package:http/http.dart' as http;

import '../exception/app_exceptons.dart';


class NetworkService {
  final String baseUrl;

  NetworkService({required this.baseUrl});

  /// Generic GET request
  Future<Map<String, dynamic>> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw NetworkException('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw NetworkException('Network error: $e');
    }
  }

  /// Generic POST request
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.post(url, body: json.encode(body), headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw NetworkException('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      throw NetworkException('Network error: $e');
    }
  }
}
