class Book {
  String title;
  String author;
  String publicationDate;
  String isbn;

  Book({ required this.title, required this.author, required this.publicationDate, required this.isbn });

  factory Book.fromJson(Map<String, dynamic> data) {
    return Book(
      title: data['title'], 
      author: data['author'], 
      publicationDate: data['publicationDate'],
      isbn: data['isbn']
    );
  }
}