import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grace/model/material/material_descriptor.dart';
import 'package:grace/util/uri_builder.dart';
import 'package:http/http.dart' as http;

class MaterialApi {
  static String host = dotenv.env['MATERIAL_API_HOST'] ?? 'localhost:8080';

  static bool secure = dotenv.env['PROTOCOL'] == 'https';

  static Future<dynamic> fetchOne({
    required MaterialDescriptor descriptor,
    required int id,
  }) async {
    return await http.get(
      UriBuilder.asUri(
        secure,
        host,
        descriptor.endpoint,
        query: {'id': id},
      ),
    );
  }

  static Future<dynamic> fetchMany({
    required MaterialDescriptor descriptor,
    required List<int> idSet,
  }) async {
    return await http.get(
      UriBuilder.asUri(
        secure,
        host,
        descriptor.endpoint,
        query: {'id': idSet.join(',')},
      ),
    );
  }

  static Future<dynamic> fetchExistence({
    required MaterialDescriptor descriptor,
  }) async {
    return await http.get(
      UriBuilder.asUri(
        secure,
        host,
        '${descriptor.endpoint}/exist',
      ),
    );
  }

  static Future<dynamic> updateOne({
    required MaterialDescriptor descriptor,
    required Map<String, dynamic> data,
  }) async {
    return await http.put(
      UriBuilder.asUri(secure, host, descriptor.endpoint),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: data,
    );
  }

  static Future<dynamic> storeOne({
    required MaterialDescriptor descriptor,
    required String id,
  }) async {
    return await http.post(
      UriBuilder.asUri(
        secure,
        host,
        descriptor.endpoint,
        query: {'id': id},
      ),
    );
  }

  static Future<dynamic> search({
    required MaterialDescriptor descriptor,
    required String query,
  }) async {
    return await http.get(
      UriBuilder.asUri(
        secure,
        host,
        '${descriptor.endpoint}/search',
        query: {'query': query},
      ),
    );
  }
}
