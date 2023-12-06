import 'package:grace/api/open_library.dart';
import 'package:test/test.dart';

void main() {
  test('fetchAuthor should fetch an author with a valid AID', () async {
    var author = await OpenLibraryApi.fetchAuthor('OL23919A');

    expect(author, isNotNull);
    expect(author?['name'], equals('J. K. Rowling'));
  });

  test('fetchAuthor should return null with an invalid AID', () async {
    var author = await OpenLibraryApi.fetchAuthor('000000');

    expect(author, isNull);
  });

  test('fetchEdition should fetch an edition with a valid EID', () async {
    var edition = await OpenLibraryApi.fetchEdition('OL7353617M');

    expect(edition, isNotNull);
    expect(edition?['title'], equals('Fantastic Mr. Fox'));
  });

  test('fetchEdition should return null with an invalid EID', () async {
    var edition = await OpenLibraryApi.fetchEdition('000000');

    expect(edition, isNull);
  });

  test('fetchWork should fetch a work with a valid WID', () async {
    var work = await OpenLibraryApi.fetchWork('OL45804W');

    expect(work, isNotNull);
    expect(work?['title'], equals('Fantastic Mr Fox'));
  });

  test('fetchWork should return null with an invalid WID', () async {
    var work = await OpenLibraryApi.fetchWork('000000');

    expect(work, isNull);
  });
}
