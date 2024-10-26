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
      _ => throw const FormatException('Failed to load Todo'),
    };
  }
}