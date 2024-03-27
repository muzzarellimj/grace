class MovieSearchResult {
  int id;
  String title;
  int releaseDate;
  String image;

  MovieSearchResult({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.image,
  });

  factory MovieSearchResult.fromJson(Map<String, dynamic> input) {
    return MovieSearchResult(
      id: input['id'],
      title: input['title'],
      releaseDate: input['release_date'],
      image: input['image'],
    );
  }
}
