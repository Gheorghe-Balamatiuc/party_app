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

  Future<Party> createParty(String title, double budget) async {
    final response = await http.post(
      Uri.parse("$baseUrl/Party"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "partyName": title,
        "budget": budget,
      }),
    );

    if (response.statusCode == 201) {
      return Party.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create party');
    }
  }

  Future<PartyWithMembers> fetchParty(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/Party/$id"));
    
    if (response.statusCode == 200) {
      return PartyWithMembers.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load party');
    }
  }
}