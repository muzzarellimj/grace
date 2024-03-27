class GameSearchResult {
  int id;
  String title;
  int releaseDate;
  String image;

  GameSearchResult({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.image,
  });

  factory GameSearchResult.fromJson(Map<String, dynamic> input) {
    return GameSearchResult(
      id: input['id'],
      title: input['title'],
      releaseDate: input['release_date'],
      image: input['image'],
    );
  }
}
