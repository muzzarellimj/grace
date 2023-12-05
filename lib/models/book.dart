class Book {
  String title;
  String? description;
  String? excerpt;
  List? authors;
  List? publishers;
  List? contributors;
  int? pageCount;
  String? publicationDate;
  String? isbn10;
  String? isbn13;

  Book({
    required this.title,
    required this.description,
    required this.excerpt,
    this.authors,
    required this.publishers,
    this.contributors,
    required this.pageCount,
    required this.publicationDate,
    required this.isbn10,
    required this.isbn13,
  });

  factory Book.fromJson(Map<String, dynamic> data) {
    return Book(
      title: data['title'],
      description: data['description'],
      excerpt: data['excerpt'],
      authors: data['authors'],
      publishers: data['publishers'],
      contributors: data['contributors'],
      pageCount: data['pageCount'],
      publicationDate: data['publicationDate'],
      isbn10: data['isbn10'],
      isbn13: data['isbn13'],
    );
  }
}
