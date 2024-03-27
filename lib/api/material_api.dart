import 'package:grace/model/material/material.dart';
import 'package:http/http.dart' as http;

const String host = 'localhost:8080';

class MaterialApi {
  static Future<dynamic> fetch(Material material, int id) async {
    http.Response response =
        await http.get(Uri.http(host, material.endpoint, {'id': '$id'}));

    return response;
  }

  static Future<dynamic> store(Material material, int id) async {
    http.Response response =
        await http.post(Uri.http(host, material.endpoint, {'id': '$id'}));

    return response;
  }

  static Future<dynamic> search(Material material, String query) async {
    http.Response response = await http
        .get(Uri.http(host, '${material.endpoint}/search', {'query': query}));

    return response;
  }
}
