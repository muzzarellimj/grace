import 'package:grace/model/response/response_status.dart';

class GetMaterialSetResponse<M> {
  ResponseStatus status;
  String? message;
  List<M>? materials;

  GetMaterialSetResponse({
    required this.status,
    required this.message,
    required this.materials,
  });
}
