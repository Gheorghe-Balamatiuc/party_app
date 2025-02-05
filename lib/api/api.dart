import 'dart:convert';

import 'package:party_app/helpers/constants.dart';
import 'package:party_app/models/member.dart';
import 'package:party_app/models/party.dart';
import 'package:http/http.dart' as http;
import 'package:party_app/services/auth_service.dart';

class ApiService {
  final String baseUrl = auth0Audience;

  Future<List<Party>> fetchParties() async {
    final response = await http.get(
      Uri.parse("${baseUrl}Party"),
      headers: {'Authorization': 'Bearer ${AuthService.instance.credentials?.accessToken}'},  
    );

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return List<Party>.from(list.map((model) => Party.fromJson(model)));
    } else {
      throw Exception('Failed to load parties');
    }
  }

  Future<Party> createParty(String title, double budget) async {
    final response = await http.post(
      Uri.parse("${baseUrl}Party"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${AuthService.instance.credentials?.accessToken}',
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
    final response = await http.get(
      Uri.parse("${baseUrl}Party/$id"),
      headers: {'Authorization': 'Bearer ${AuthService.instance.credentials?.accessToken}'},    
    );
    
    if (response.statusCode == 200) {
      return PartyWithMembers.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load party');
    }
  }

  Future<void> deleteParty(int id) async {
    final response = await http.delete(
      Uri.parse("${baseUrl}Party/$id"),
      headers: {'Authorization': 'Bearer ${AuthService.instance.credentials?.accessToken}'},
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete party');
    }
  }

  Future<void> modifyParty(int id, String title, double budget) async {
    final response = await http.put(
      Uri.parse("${baseUrl}Party/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${AuthService.instance.credentials?.accessToken}',
      },
      body: jsonEncode(<String, dynamic>{
        "partyId": id,
        "partyName": title,
        "budget": budget,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to modify party');
    }
  }

  Future<Member> addMember(String firstName, String lastName, int partyId) async {
    final response = await http.post(
      Uri.parse("${baseUrl}Member"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${AuthService.instance.credentials?.accessToken}',
      },
      body: jsonEncode(<String, dynamic>{
        "firstName": firstName,
        "lastName": lastName,
        "partyId": partyId,
      }),
    );

    if (response.statusCode == 201) {
      return Member.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to add member');
    }
  }

  Future<void> deleteMember(int id) async {
    final response = await http.delete(
      Uri.parse("${baseUrl}Member/$id"),
      headers: {'Authorization': 'Bearer ${AuthService.instance.credentials?.accessToken}'},
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete member');
    }
  }
}