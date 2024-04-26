import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grace/model/response/get_library.dart';
import 'package:grace/model/response/response_status.dart';

class LibraryService {
  final String defaultErrorMessage = 'Oops! We hit a snag. Please try again.';

  Future<GetLibraryResponse> get(String id) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('libraries')
        .where('user', isEqualTo: id)
        .get();

    if (snapshot.docs.isEmpty) {
      return GetLibraryResponse(
        status: ResponseStatus.failure,
        message: defaultErrorMessage,
      );
    }

    var documentData = snapshot.docs[0].data() as Map<String, dynamic>;
    List books = documentData['books'];
    List games = documentData['games'];
    List movies = documentData['movies'];

    return GetLibraryResponse(
      status: ResponseStatus.success,
      books: books.cast<int>(),
      games: games.cast<int>(),
      movies: movies.cast<int>(),
    );
  }
}
