import 'package:grace/model/response/response_status.dart';

class StoreLibraryResponse {
  ResponseStatus status;
  String? message;

  StoreLibraryResponse({
    required this.status,
    this.message,
  });
}
