import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grace/model/material/material_descriptor.dart';
import 'package:grace/model/response/get_library.dart';
import 'package:grace/model/response/response_status.dart';
import 'package:grace/model/response/store_library.dart';

class LibraryService {
  final String defaultErrorMessage = 'Oops! We hit a snag. Please try again.';

  Future<GetLibraryResponse> fetch(String userId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('libraries')
        .where('user', isEqualTo: userId)
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

  Future<StoreLibraryResponse> store(
    String userId,
    MaterialDescriptor matDescriptor,
    int matId,
  ) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('libraries')
        .where('user', isEqualTo: userId)
        .get();

    if (snapshot.docs.isEmpty) {
      return StoreLibraryResponse(
        status: ResponseStatus.failure,
        message: defaultErrorMessage,
      );
    }

    var documentReference = snapshot.docs[0].reference;

    await documentReference.update({
      matDescriptor.table: FieldValue.arrayUnion([matId]),
    });

    return StoreLibraryResponse(status: ResponseStatus.success);
  }
}
