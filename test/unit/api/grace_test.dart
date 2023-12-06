import 'package:grace/api/grace.dart';
import 'package:test/test.dart';

void main() {
  test('fetchBook should fetch and parse data with a valid ISBN', () async {
    var book = await GraceApi.fetchBook('9780316452465');

    expect(book, isNotNull);
    expect(book?['title'], equals('The Last Wish'));
    expect(book?['authors'], hasLength(2));
    expect(book?['authors'], contains('Andrzej Sapkowski'));
  });

  test('fetchBook should return null with an invalid ISBN', () async {
    var book = await GraceApi.fetchBook('000000000');

    expect(book, isNull);
  });
}
