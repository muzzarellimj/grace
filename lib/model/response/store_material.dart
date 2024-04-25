import 'package:grace/model/response/response_status.dart';

class StoreMaterialResponse {
  ResponseStatus status;
  String? message;
  int? id;

  StoreMaterialResponse({
    required this.status,
    this.message,
    this.id,
  });
}
