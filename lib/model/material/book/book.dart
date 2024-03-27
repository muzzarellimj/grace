import 'package:grace/model/material/book/author.dart';
import 'package:grace/model/material/book/publisher.dart';
import 'package:grace/model/material/book/topic.dart';

class Book {
  int id;
  String title;
  String subtitle;
  String description;
  List<BookAuthor> authors;
  List<BookPublisher> publishers;
  List<BookTopic> topics;
  String publishDate;
  int pages;
  String isbn10;
  String isbn13;
  String image;
  String editionReference;
  String workReference;

  Book({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.authors,
    required this.publishers,
    required this.topics,
    required this.publishDate,
    required this.pages,
    required this.isbn10,
    required this.isbn13,
    required this.image,
    required this.editionReference,
    required this.workReference,
  });

  factory Book.fromJson(Map<String, dynamic> input) {
    List<BookAuthor> authors = (input['authors'] as List)
        .map((author) => BookAuthor.fromJson(author))
        .toList();

    List<BookPublisher> publishers = (input['publishers'] as List)
        .map((publisher) => BookPublisher.fromJson(publisher))
        .toList();

    List<BookTopic> topics = (input['topics'] as List)
        .map((topic) => BookTopic.fromJson(topic))
        .toList();

    return Book(
      id: input['id'],
      title: input['title'],
      subtitle: input['subtitle'],
      description: input['description'],
      authors: authors,
      publishers: publishers,
      topics: topics,
      publishDate: input['publish_date'],
      pages: input['pages'],
      isbn10: input['isbn10'],
      isbn13: input['isbn13'],
      image: input['image'],
      editionReference: input['edition_reference'],
      workReference: input['work_reference'],
    );
  }
}
