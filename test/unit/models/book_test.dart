// {title: The Last Wish, description: null, excerpt: null, authors: [Andrzej Sapkowski, Danusia Stok], publishers: (Orbit), contributors: null, pageCount: 352, publicationDate: Jul 05, 2022, isbn10: 0316452467, isbn13: 9780316452465}

import 'package:grace/models/book.dart';
import 'package:test/test.dart';

void main() {
  test('Book.fromJson should construct a Book with valid data', () {
    var data = {
      'title': 'The Last Wish',
      'description': null,
      'excerpt': null,
      'authors': ['Andrzej Sapkowski', 'Danusia Stok'],
      'publishers': ['Orbit'],
      'contributors': null,
      'pageCount': 352,
      'publicationDate': 'Jul 05, 2022',
      'isbn10': '0316452467',
      'isbn13': '9780316452465'
    };

    Book book = Book.fromJson(data);

    expect(book, isNotNull);
    expect(book.title, equals('The Last Wish'));
    expect(book.authors, contains('Andrzej Sapkowski'));
  });
}
