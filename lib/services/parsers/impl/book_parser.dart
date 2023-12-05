import 'package:grace/services/parsers/resource_parser.dart';

/// A concrete ResourceParser implementation to parse Book resources fetched from the Open Library API.
class BookParser implements ResourceParser {
  @override
  Map<String, dynamic>? parse(Map<String, dynamic>? data) {
    var authors = (data?['authors'] as List).map((author) {
      return author?['name'].toString();
    }).toList();

    var publishers =
        (data?['edition']['publishers'] as List?)?.map((publisher) {
      return publisher.toString();
    });

    var contributors =
        (data?['edition']['contributions'] as List?)?.map((contributor) {
      return contributor.toString();
    });

    return {
      'title': data?['edition']['title'] ?? data?['work']['title'],
      'description': data?['work']['value'],
      'excerpt': data?['work']['excerpts']?[0]?['excerpt'],
      'authors': authors,
      'publishers': publishers,
      'contributors': contributors,
      'pageCount': data?['edition']['number_of_pages'],
      'publicationDate': data?['edition']['publish_date'],
      'isbn10': data?['edition']['isbn_10']?[0],
      'isbn13': data?['edition']['isbn_13']?[0],
    };
  }

  Map<String, dynamic>? prepare({
    required Map<String, dynamic> edition,
    required Map<String, dynamic> work,
    required List<Map<String, dynamic>?> authors,
  }) {
    return {
      'edition': edition,
      'work': work,
      'authors': authors,
    };
  }
}
