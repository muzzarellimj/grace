import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grace/api/firebase.dart';
import 'package:grace/services/queries/query_strategy.dart';

class AlphabeticalQueryStrategy implements QueryStrategy {
  @override
  Stream<QuerySnapshot> resolve(String collection) {
    return FirebaseApi.query(collection, orderBy: 'title');
  }
}
