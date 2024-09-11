
abstract class FirestoreRepository<T> {
  Future<bool> create(T entity);
  Future<bool> createWithDocId(T entity, String id);
  Future<T?> getById(String id);
}
