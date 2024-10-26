import 'dart:convert';

import 'package:party_app/models/party.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://localhost:7041";

  Future<List<Party>> fetchParties() async {
    final response = await http.get(Uri.parse("$baseUrl/api/Party"));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return List<Party>.from(list.map((model) => Party.fromJson(model)));
    } else {
      throw Exception('Failed to load parties');
    }
  }

  Future<Party> createParty(String name, String budget) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/Party'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'partyName': name,
        'budget': budget,
        'memberResponsibilities': [].toString(),
      }),
    );

    if (response.statusCode == 201) {
      return Party.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      print(response.body);
      throw Exception('Failed to create Party.');
    }
  }
}