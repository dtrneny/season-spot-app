import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestorePredicate {
  final String field;

  FirestorePredicate({required this.field});

  Query apply(Query query);
}
