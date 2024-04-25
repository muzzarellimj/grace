import 'package:grace/model/authentication/profile.dart';
import 'package:grace/model/response/response_status.dart';

class GetUserSetResponse {
  ResponseStatus status;
  List<Profile>? users;
  String? message;

  GetUserSetResponse({
    required this.status,
    this.users,
    this.message,
  });
}
