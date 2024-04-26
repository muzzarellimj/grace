import 'package:grace/model/response/response_status.dart';

class GetLibraryResponse {
  ResponseStatus status;
  String? message;
  List<int>? books;
  List<int>? games;
  List<int>? movies;

  GetLibraryResponse({
    required this.status,
    this.message,
    this.books,
    this.games,
    this.movies,
  });
}
