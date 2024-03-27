class MovieProductionCompany {
  int id;
  String name;
  String image;
  int reference;

  MovieProductionCompany({
    required this.id,
    required this.name,
    required this.image,
    required this.reference,
  });

  factory MovieProductionCompany.fromJson(Map<String, dynamic> input) {
    return MovieProductionCompany(
      id: input['id'],
      name: input['name'],
      image: input['image'],
      reference: input['reference'],
    );
  }
}
