import 'package:cloud_firestore/cloud_firestore.dart';

abstract class QueryStrategy {
  Stream<QuerySnapshot> resolve(String collection);
}
