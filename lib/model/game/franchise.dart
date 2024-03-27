class GameFranchise {
  int id;
  String name;
  int reference;

  GameFranchise({
    required this.id,
    required this.name,
    required this.reference,
  });

  factory GameFranchise.fromJson(Map<String, dynamic> input) {
    return GameFranchise(
      id: input['id'],
      name: input['name'],
      reference: input['reference'],
    );
  }
}
