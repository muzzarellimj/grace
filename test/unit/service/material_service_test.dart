import 'package:grace/model/book/book.dart';
import 'package:grace/model/response/get_material.dart';
import 'package:grace/service/material/material.dart';
import 'package:grace/service/material/material_service.dart';
import 'package:grace/service/response_status.dart';
import 'package:test/test.dart';

void main() {
  group('MaterialService<Book>', () {
    test(
        '.fetch(1) should return ResponseStatus.success, no message, and Book object.',
        () async {
      MaterialService<Book> service = MaterialService(material: Material.book);

      GetMaterialResponse<Book> response = await service.fetch(1);
      expect(response.status, equals(ResponseStatus.success));
      expect(response.message, isNull);
      expect(response.material, isNotNull);

      Book? book = response.material;
      expect(book, isNotNull);
      expect(book?.title, equals('The Last Wish'));
    });

    test(
        '.fetch(-1) should return ResponseStatus.warning, message, and no Book object.',
        () async {
      MaterialService<Book> service = MaterialService(material: Material.book);

      GetMaterialResponse<Book> response = await service.fetch(-1);
      expect(response.status, equals(ResponseStatus.warning));
      expect(response.message, isNotNull);
      expect(response.material, isNull);
    });
  });
}
