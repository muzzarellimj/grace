import 'package:grace/model/response/response_status.dart';

class UpdateMaterialResponse {
  ResponseStatus status;
  String? message;
  int? id;

  UpdateMaterialResponse({
    required this.status,
    this.message,
    this.id,
  });
}
