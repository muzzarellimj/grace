import 'dart:convert';

import 'package:http/http.dart' as http;

const String base = 'openlibrary.org';

class OpenLibraryApi {
  static Future<Map<String, dynamic>?> fetchAuthor(String id) async {
    var response = await http.get(Uri.https(base, 'authors/$id.json'));

    return response.statusCode == 200 ? jsonDecode(response.body) : null;
  }

  static Future<Map<String, dynamic>?> fetchEdition(String id) async {
    var response = await http.get(Uri.https(base, 'isbn/$id.json'));

    return response.statusCode == 200 ? jsonDecode(response.body) : null;
  }

  static Future<Map<String, dynamic>?> fetchWork(String id) async {
    var response = await http.get(Uri.https(base, 'works/$id.json'));

    return response.statusCode == 200 ? jsonDecode(response.body) : null;
  }
}
