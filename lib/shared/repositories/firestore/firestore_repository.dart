import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/core/query_predicate/index.dart';

abstract class FirestoreRepository<T extends FirestoreSerializable> {
  Future<bool> create(T entity);
  Future<bool> createWithDocId(T entity, String id);
  Future<T?> getById(String id);
  Future<List<T>> getAll([List<QueryPredicate> predicates = const []]);
}
