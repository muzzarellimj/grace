class BookSearchResult {
  String id;
  String title;
  int publishDate;
  String isbn10;
  String isbn13;

  BookSearchResult({
    required this.id,
    required this.title,
    required this.publishDate,
    required this.isbn10,
    required this.isbn13,
  });

  factory BookSearchResult.fromJson(Map<String, dynamic> input) {
    return BookSearchResult(
      id: input['id'],
      title: input['title'],
      publishDate: input['publish_date'],
      isbn10: input['isbn_10'],
      isbn13: input['isbn_13'],
    );
  }
}
