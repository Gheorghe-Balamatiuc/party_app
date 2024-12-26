import 'package:party_app/models/member.dart';

class Party {
  Party({
    required this.id, 
    required this.name, 
    required this.budget,
  });

  int id;
  String name;
  double budget;

  factory Party.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'partyId' : int id,
        'partyName' : String name,
        'budget' : double budget,
      } => Party(
          id: id,
          name: name,
          budget: budget,
        ),
      _ => throw const FormatException('Failed to load Party'),
    };
  }
}

class PartyWithMembers extends Party {
  PartyWithMembers({
    required super.id,
    required super.name,
    required super.budget,
    required this.members,
  });

  List<Member> members;

  factory PartyWithMembers.fromJson(Map<String, dynamic> json) {
    var membersJson = json['members'] as List<dynamic>;
    List<Member> members = List<Member>.from(membersJson.map((model) => Member.fromJson(model)));

    return switch (json) {
      {
        'partyId' : int id,
        'partyName' : String name,
        'budget' : double budget,
        'members' : List<dynamic> _,
      } => PartyWithMembers(
        id: id,
        name: name,
        budget: budget,
        members: members,
      ),
      _ => throw const FormatException('Failed to load Party'),
    };
  }
}