import 'package:grace/api/open_library.dart';
import 'package:grace/services/parsers/impl/book_parser.dart';
import 'package:grace/utilities/parse_utilities.dart';

/// An internal API meant to provide a facade to chain external API calls to gather and parse data.
class GraceApi {
  static Future<Map<String, dynamic>?> fetchBook(String isbn) async {
    // fetch edition to store isbn-specific data
    var editionResponse = await OpenLibraryApi.fetchEdition(isbn);

    if (editionResponse == null) {
      return null;
    }

    // parse work id from editionResponse
    var workId = ParseUtilities.formatResourceId(
      editionResponse['works']?[0]['key'],
      remove: '/works/',
    );

    if (workId == null) {
      return null;
    }

    // fetch work to store broader data
    var workResponse = await OpenLibraryApi.fetchWork(workId);

    if (workResponse == null) {
      return null;
    }

    // parse author id set from workResponse
    var authorIdSet = (workResponse['authors'] as List?)?.map((author) {
      return ParseUtilities.formatResourceId(
        author['author']?['key'],
        remove: '/authors/',
      );
    }).toList();

    if (authorIdSet == null || authorIdSet.isEmpty) {
      return null;
    }

    // fetch authors to store author-specific data
    var authorFutures = authorIdSet.map((authorId) async {
      if (authorId == null) {
        return null;
      }

      var authorResponse = await OpenLibraryApi.fetchAuthor(authorId);

      if (authorResponse == null) {
        return null;
      }
    });

    var authorResponses = await Future.wait(authorFutures);

    if (authorResponses.isEmpty) {
      return null;
    }

    // parse book data from collected responses
    BookParser parser = BookParser();

    var parserData = parser.prepare(
      edition: editionResponse,
      work: workResponse,
      authors: authorResponses,
    );

    return parser.parse(parserData);
  }
}
