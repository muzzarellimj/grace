import 'package:grace/service/response_status.dart';

class GetMaterialResponse<M> {
  ResponseStatus status;
  String? message;
  M? material;

  GetMaterialResponse({
    required this.status,
    required this.message,
    required this.material,
  });
}
