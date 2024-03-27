import 'package:grace/model/material/book/book.dart';
import 'package:grace/model/material/material.dart';
import 'package:grace/model/material/movie/search_result.dart';
import 'package:grace/model/response/get_material.dart';
import 'package:grace/model/response/get_material_set.dart';
import 'package:grace/model/response/response_status.dart';
import 'package:grace/service/material_service.dart';
import 'package:test/test.dart';

void main() {
  group('MaterialService<Book>', () {
    test(
        '.fetch(1) should return ResponseStatus.success, no message, and Book object',
        () async {
      MaterialService service = MaterialService<Book>(material: Material.book);

      GetMaterialResponse response = await service.fetch(1);
      expect(response.status, equals(ResponseStatus.success));
      expect(response.message, isNull);
      expect(response.material, isNotNull);

      Book book = response.material;
      expect(book, isNotNull);
      expect(book.title, equals('The Last Wish'));
    });

    test(
        '.fetch(-1) should return ResponseStatus.warning, message, and no Book object',
        () async {
      MaterialService service = MaterialService<Book>(material: Material.book);

      GetMaterialResponse response = await service.fetch(-1);
      expect(response.status, equals(ResponseStatus.warning));
      expect(response.message, isNotNull);
      expect(response.material, isNull);
    });
  });

  group('MaterialService<MovieSearchResult>', () {
    test(
        '.search(`harry potter philosopher`) should return ResponseStatus.success, no message, and List<MovieSearchResult>',
        () async {
      MaterialService service =
          MaterialService<MovieSearchResult>(material: Material.movie);

      GetMaterialSetResponse response =
          await service.search('harry potter philosopher');
      expect(response.status, equals(ResponseStatus.success));
      expect(response.message, isNull);
      expect(response.materials?.length, greaterThan(0));

      MovieSearchResult result = response.materials?.first;
      expect(result, isNotNull);
      expect(result.title, equals('Harry Potter and the Philosopher\'s Stone'));
    });

    test(
        '.search(``) should return ResponseStatus.warning, message, and empty List<MovieSearchResult>',
        () async {
      MaterialService service =
          MaterialService<MovieSearchResult>(material: Material.movie);

      GetMaterialSetResponse response = await service.search('');
      expect(response.status, equals(ResponseStatus.warning));
      expect(response.message, isNotNull);
      expect(response.materials?.length, equals(0));
    });
  });
}
