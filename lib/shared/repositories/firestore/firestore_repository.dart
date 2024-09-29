import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/core/query_predicate/index.dart';

abstract class FirestoreRepository<T extends FirestoreSerializable> {
  Future<String?> create(T entity);
  Future<String?> createWithDocId(T entity, String id);
  Future<T?> getById(String id);
  Future<List<T>> getAll([List<QueryPredicate> predicates = const []]);
  Future<void> update(String id, Map<String, dynamic> data);
}
