import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/core/query_predicate/index.dart';
import 'package:season_spot/shared/repositories/firestore/firestore_repository.dart';

class FirestoreRepositoryImpl<T extends FirestoreSerializable>
    implements FirestoreRepository<T> {
  final FirebaseFirestore _firestore;
  final String _collectionPath;

  FirestoreRepositoryImpl(
    this._firestore,
    this._collectionPath,
    this.fromDoc,
  );

  @override
  late T Function(Map<String, dynamic> data, String id) fromDoc;

  @override
  Future<String?> create(T entity) async {
    print(entity);
    final data = entity.toJson();
    data.remove('id');
    print(data);
    final result = await _firestore.collection(_collectionPath).add(data);
    return result.id;
  }

  @override
  Future<String?> createWithDocId(T entity, String id) async {
    final data = entity.toJson();
    data.remove('id');
    await _firestore.collection(_collectionPath).doc(id).set(data);
    return id;
  }

  @override
  Future<T?> getById(String id) async {
    final result = await _firestore.collection(_collectionPath).doc(id).get();
    final data = result.data();

    if (data == null) {
      return null;
    }

    return fromDoc(data, id);
  }

  @override
  Future<List<T>> getAll([List<QueryPredicate> predicates = const []]) async {
    CollectionReference collection = _firestore.collection(_collectionPath);
    Query query = collection;

    for (QueryPredicate predicate in predicates) {
      query = predicate.apply(query);
    }
    QuerySnapshot querySnapshot = await query.get();

    return querySnapshot.docs
        .map((doc) {
          final data = doc.data() as Map<String, dynamic>?;
          return data != null ? fromDoc(data, doc.id) : null;
        })
        .whereType<T>()
        .toList();
  }

  @override
  Future<void> update(String id, Map<String, dynamic> data) async {
    await _firestore.collection(_collectionPath).doc(id).update(data);
  }
}
