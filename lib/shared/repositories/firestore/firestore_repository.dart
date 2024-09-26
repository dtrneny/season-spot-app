import 'package:season_spot/core/helpers/index.dart';

abstract class FirestoreRepository<T extends FirestoreSerializable> {
  Future<bool> create(T entity);
  Future<bool> createWithDocId(T entity, String id);
  Future<T?> getById(String id);
}
