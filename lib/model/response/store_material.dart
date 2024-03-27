import 'package:grace/model/response/response_status.dart';

class StoreMaterialResponse {
  ResponseStatus status;
  String? message;

  StoreMaterialResponse({
    required this.status,
    required this.message,
  });
}
