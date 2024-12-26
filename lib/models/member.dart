class Member {
  Member({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.partyId,
  });

  int id;
  String firstName;
  String lastName;
  int partyId;

  factory Member.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'memberId': int id,
        'firstName': String firstName,
        'lastName': String lastName,
        'partyId': int partyId,
      } => Member(
        id: id,
        firstName: firstName,
        lastName: lastName,
        partyId: partyId,
      ),
      _ => throw const FormatException('Failed to load Member'),
    };
  }
}