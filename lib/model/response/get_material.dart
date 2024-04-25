import 'package:grace/model/response/response_status.dart';

class GetMaterialResponse<M> {
  ResponseStatus status;
  String? message;
  List<M>? materials;

  GetMaterialResponse({
    required this.status,
    this.message,
    this.materials,
  });
}
