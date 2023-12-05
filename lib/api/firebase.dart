import 'package:cloud_firestore/cloud_firestore.dart';

/// A facade to ease access to the Firebase tool suite; e.g., data insertion to Firestore.
class FirebaseApi {
  static final FirebaseFirestore _store = FirebaseFirestore.instance;

  static Stream<QuerySnapshot> query(
    String collection, {
    String? field,
    String? value,
    int? limit,
  }) {
    CollectionReference collectionReference = _store.collection(collection);
    Query query = collectionReference;

    if (field != null && value != null) {
      query = collectionReference.where(field, isEqualTo: value);
    }

    if (limit != null) {
      query = collectionReference.limit(limit);
    }

    return query.snapshots();
  }

  static Future<DocumentReference> insertDocument(
      String collection, Map<String, dynamic> document) async {
    return await _store.collection(collection).add(document);
  }
}
