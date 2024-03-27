class GameGenre {
  int id;
  String name;
  int reference;

  GameGenre({
    required this.id,
    required this.name,
    required this.reference,
  });

  factory GameGenre.fromJson(Map<String, dynamic> input) {
    return GameGenre(
      id: input['id'],
      name: input['name'],
      reference: input['reference'],
    );
  }
}
