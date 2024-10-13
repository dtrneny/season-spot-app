import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:season_spot/shared/firestore_predicate/index.dart';

class IsEqualToPredicate extends FirestorePredicate {
  final Object? isEqualTo;

  IsEqualToPredicate(
    this.isEqualTo, {
    required super.field,
  });

  @override
  Query<Object?> apply(Query<Object?> query) {
    return query.where(field, isEqualTo: isEqualTo);
  }
}
