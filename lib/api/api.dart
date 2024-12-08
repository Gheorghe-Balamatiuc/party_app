import 'dart:convert';

import 'package:party_app/models/party.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://localhost:5028";

  Future<List<Party>> fetchParties() async {
    final response = await http.get(Uri.parse("$baseUrl/Party"));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return List<Party>.from(list.map((model) => Party.fromJson(model)));
    } else {
      throw Exception('Failed to load parties');
    }
  }
}