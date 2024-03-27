class MovieGenre {
  int id;
  String name;
  int reference;

  MovieGenre({
    required this.id,
    required this.name,
    required this.reference,
  });

  factory MovieGenre.fromJson(Map<String, dynamic> input) {
    return MovieGenre(
      id: input['id'],
      name: input['name'],
      reference: input['reference'],
    );
  }
}
