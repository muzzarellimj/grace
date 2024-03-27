import 'dart:convert';
import 'dart:io';

import 'package:grace/api/material_api.dart';
import 'package:grace/model/response/get_material.dart';
import 'package:grace/service/material/material.dart';
import 'package:grace/service/response_status.dart';
import 'package:http/http.dart' as http;

class MaterialService<M> {
  final Material material;

  MaterialService({required this.material});

  Future<GetMaterialResponse<M>> fetch(int id) async {
    http.Response response = await MaterialApi.fetch(this.material, id);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return GetMaterialResponse<M>(
          status: ResponseStatus.success,
          message: null,
          material: material.parser(jsonDecode(response.body)['data']),
        );

      default:
        return processResponse(response.statusCode);
    }
  }

  GetMaterialResponse<M> processResponse(int status) {
    switch (status) {
      case HttpStatus.noContent || HttpStatus.badRequest:
        return GetMaterialResponse<M>(
          status: ResponseStatus.warning,
          message: 'A matching material could not be found. Please try again.',
          material: null,
        );

      default:
        return GetMaterialResponse<M>(
          status: ResponseStatus.failure,
          message: 'Oops! We hit a snag. Please try again later.',
          material: null,
        );
    }
  }
}
