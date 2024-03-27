class GamePlatform {
  int id;
  String name;
  int reference;

  GamePlatform({
    required this.id,
    required this.name,
    required this.reference,
  });

  factory GamePlatform.fromJson(Map<String, dynamic> input) {
    return GamePlatform(
      id: input['id'],
      name: input['name'],
      reference: input['reference'],
    );
  }
}
