class BookSearchResult {
  String id;
  String title;
  List<String> authors;
  int publishDate;
  String image;

  BookSearchResult({
    required this.id,
    required this.title,
    required this.authors,
    required this.publishDate,
    required this.image,
  });

  factory BookSearchResult.fromJson(Map<String, dynamic> input) {
    return BookSearchResult(
      id: input['id'],
      title: input['title'],
      authors: (input['authors'] as List).cast<String>(),
      publishDate: input['publish_date'],
      image: input['image'],
    );
  }
}
