import 'package:grace/utilities/parse_utilities.dart';
import 'package:test/test.dart';

void main() {
  test('formatResourceId should format a resource ID with valid data', () {
    var authorId =
        ParseUtilities.formatResourceId('/authors/ABCDEF', remove: '/authors/');
    var editionId =
        ParseUtilities.formatResourceId('/isbn/123456', remove: '/isbn/');
    var workId =
        ParseUtilities.formatResourceId('/works/GHIJKL', remove: '/works/');

    expect(authorId, equals('ABCDEF'));
    expect(editionId, equals('123456'));
    expect(workId, equals('GHIJKL'));
  });

  test('formatResourceId should return a string when no removal is needed', () {
    var numericId = ParseUtilities.formatResourceId(123456);

    expect(numericId, equals('123456'));
  });
}
