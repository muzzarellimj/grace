import 'package:grace/model/material/book/book.dart';

class BookUpdate {
  int id;
  String title;
  String subtitle;
  String description;
  int publishDate;
  int pages;
  String isbn10;
  String isbn13;
  String image;
  String editionReference;
  String workReference;

  BookUpdate({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.publishDate,
    required this.pages,
    required this.isbn10,
    required this.isbn13,
    required this.image,
    required this.editionReference,
    required this.workReference,
  });

  factory BookUpdate.fromBook(Book book) {
    return BookUpdate(
      id: book.id,
      title: book.title,
      subtitle: book.subtitle,
      description: book.description,
      publishDate: book.publishDate,
      pages: book.pages,
      isbn10: book.isbn10,
      isbn13: book.isbn13,
      image: book.image,
      editionReference: book.editionReference,
      workReference: book.workReference,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'description': description,
        'publish_date': publishDate,
        'pages': pages,
        'isbn10': isbn10,
        'isbn13': isbn13,
        'image': image,
        'edition_reference': editionReference,
        'work_reference': workReference,
      };
}
