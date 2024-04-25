import 'dart:convert';
import 'dart:io';

import 'package:grace/api/material_api.dart';
import 'package:grace/model/material/material_descriptor.dart';
import 'package:grace/model/response/get_material.dart';
import 'package:grace/model/response/response_status.dart';
import 'package:grace/model/response/store_material.dart';
import 'package:grace/model/response/update_material.dart';
import 'package:http/http.dart' as http;

class MaterialService<F, S> {
  final MaterialDescriptor descriptor;

  MaterialService({required this.descriptor});

  final String defaultErrorMessage = 'Oops! We hit a snag. Please try again.';
  final String defaultNoContentMessage =
      'A matching material could not be found. Please try again.';

  Future<GetMaterialResponse<F>> fetchOne(int id) async {
    http.Response response = await MaterialApi.fetchOne(
      descriptor: descriptor,
      id: id,
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        List<F> results = (jsonDecode(response.body)['data'] as List)
            .map<F>((result) => descriptor.matFetchFactory(result))
            .toList();

        return GetMaterialResponse<F>(
          status: ResponseStatus.success,
          materials: results,
        );

      case HttpStatus.noContent || HttpStatus.badRequest:
        return GetMaterialResponse<F>(
          status: ResponseStatus.warning,
          message: defaultNoContentMessage,
        );

      default:
        return GetMaterialResponse<F>(
          status: ResponseStatus.failure,
          message: defaultErrorMessage,
        );
    }
  }

  Future<GetMaterialResponse<F>> fetchMany(List<int> idSet) async {
    http.Response response = await MaterialApi.fetchMany(
      descriptor: descriptor,
      idSet: idSet,
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        List<F> results = (jsonDecode(response.body)['data'] as List)
            .map<F>((result) => descriptor.matFetchFactory(result))
            .toList();

        return GetMaterialResponse<F>(
          status: ResponseStatus.success,
          materials: results,
        );

      case HttpStatus.noContent || HttpStatus.badRequest:
        return GetMaterialResponse<F>(
          status: ResponseStatus.warning,
          message: defaultNoContentMessage,
        );

      default:
        return GetMaterialResponse<F>(
          status: ResponseStatus.failure,
          message: defaultErrorMessage,
        );
    }
  }

  Future<GetMaterialResponse<F>> fetchRecent({
    int limit = 10,
  }) async {
    http.Response existenceResponse = await MaterialApi.fetchExistence(
      descriptor: descriptor,
    );

    if (existenceResponse.statusCode != HttpStatus.ok) {
      return GetMaterialResponse(
        status: ResponseStatus.failure,
        message: defaultErrorMessage,
      );
    }

    List<int> idSet = jsonDecode(existenceResponse.body)['data'].cast<int>();
    idSet.sort();

    if (limit >= idSet.length) {
      limit = idSet.length - 1;
    }

    List<int> recentIdSet =
        idSet.sublist(idSet.length - limit - 1, idSet.length - 1);

    return await fetchMany(recentIdSet);
  }

  Future<UpdateMaterialResponse> updateOne(Map<String, dynamic> data) async {
    http.Response response = await MaterialApi.updateOne(
      descriptor: descriptor,
      data: data,
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        return UpdateMaterialResponse(
          status: ResponseStatus.success,
          id: jsonDecode(response.body)['id'],
        );

      case HttpStatus.noContent || HttpStatus.badRequest:
        return UpdateMaterialResponse(
          status: ResponseStatus.warning,
          message: defaultNoContentMessage,
        );

      default:
        return UpdateMaterialResponse(
          status: ResponseStatus.failure,
          message: defaultErrorMessage,
        );
    }
  }

  Future<StoreMaterialResponse> storeOne(String id) async {
    http.Response response = await MaterialApi.storeOne(
      descriptor: descriptor,
      id: id,
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        return StoreMaterialResponse(
          status: ResponseStatus.success,
          id: jsonDecode(response.body)['id'],
        );

      case HttpStatus.noContent || HttpStatus.badRequest:
        return StoreMaterialResponse(
          status: ResponseStatus.warning,
          message: defaultNoContentMessage,
        );

      default:
        return StoreMaterialResponse(
          status: ResponseStatus.failure,
          message: defaultErrorMessage,
        );
    }
  }

  Future<GetMaterialResponse<S>> search(String query) async {
    http.Response response = await MaterialApi.search(
      descriptor: descriptor,
      query: query,
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        List<S> results = (jsonDecode(response.body)['data'] as List)
            .map<S>((result) => descriptor.matSearchFactory(result))
            .toList();

        return GetMaterialResponse(
          status: ResponseStatus.success,
          materials: results,
        );

      case HttpStatus.noContent || HttpStatus.badRequest:
        return GetMaterialResponse(
          status: ResponseStatus.warning,
          message: defaultNoContentMessage,
        );

      default:
        return GetMaterialResponse(
          status: ResponseStatus.failure,
          message: defaultErrorMessage,
        );
    }
  }
}
