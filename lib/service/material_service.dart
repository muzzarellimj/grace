import 'dart:convert';
import 'dart:io';

import 'package:grace/api/material_api.dart';
import 'package:grace/model/material/material.dart';
import 'package:grace/model/response/get_material.dart';
import 'package:grace/model/response/get_material_set.dart';
import 'package:grace/model/response/response_status.dart';
import 'package:grace/model/response/store_material.dart';
import 'package:http/http.dart' as http;

class MaterialService<M> {
  final Material material;

  MaterialService({required this.material});

  final String defaultErrorMessage = 'Oops! We hit a snag. Please try again.';

  Future<GetMaterialResponse<M>> fetch(int id) async {
    http.Response response = await MaterialApi.fetch(material, id);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return GetMaterialResponse<M>(
          status: ResponseStatus.success,
          message: null,
          material: material.matFactory(jsonDecode(response.body)['data']),
        );

      case HttpStatus.noContent || HttpStatus.badRequest:
        return GetMaterialResponse<M>(
          status: ResponseStatus.warning,
          message: 'A material could not be found. Please try again.',
          material: null,
        );

      default:
        return GetMaterialResponse<M>(
          status: ResponseStatus.failure,
          message: defaultErrorMessage,
          material: null,
        );
    }
  }

  Future<StoreMaterialResponse> store(String id) async {
    http.Response response = await MaterialApi.store(material, id);

    switch (response.statusCode) {
      case HttpStatus.ok || HttpStatus.created:
        return StoreMaterialResponse(
          status: ResponseStatus.success,
          message: null,
        );

      case HttpStatus.noContent || HttpStatus.badRequest:
        return StoreMaterialResponse(
          status: ResponseStatus.warning,
          message: 'A matching material could not be found. Please try again.',
        );

      default:
        return StoreMaterialResponse(
          status: ResponseStatus.failure,
          message: defaultErrorMessage,
        );
    }
  }

  Future<GetMaterialSetResponse<M>> search(String query) async {
    http.Response response = await MaterialApi.search(material, query);

    switch (response.statusCode) {
      case HttpStatus.ok:
        List<M> results = (jsonDecode(response.body)['data'] as List)
            .map<M>((result) => material.setFactory(result))
            .toList();

        return GetMaterialSetResponse<M>(
          status: ResponseStatus.success,
          message: null,
          materials: results,
        );

      case HttpStatus.noContent || HttpStatus.badRequest:
        return GetMaterialSetResponse<M>(
          status: ResponseStatus.warning,
          message: 'A matching material could not be found. Please try again.',
          materials: List.empty(),
        );

      default:
        return GetMaterialSetResponse<M>(
          status: ResponseStatus.failure,
          message: defaultErrorMessage,
          materials: List.empty(),
        );
    }
  }
}
