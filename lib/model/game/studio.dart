class GameStudio {
  int id;
  String name;
  String description;
  int reference;

  GameStudio({
    required this.id,
    required this.name,
    required this.description,
    required this.reference,
  });

  factory GameStudio.fromJson(Map<String, dynamic> input) {
    return GameStudio(
      id: input['id'],
      name: input['name'],
      description: input['description'],
      reference: input['reference'],
    );
  }
}
