import 'package:cloud_firestore/cloud_firestore.dart';

abstract class QueryPredicate {
  final String field;

  QueryPredicate({required this.field});

  Query apply(Query query);
}
