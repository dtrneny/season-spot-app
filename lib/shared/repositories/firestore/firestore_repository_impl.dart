import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/core/query_predicate/index.dart';
import 'package:season_spot/shared/repositories/firestore/firestore_repository.dart';

class FirestoreRepositoryImpl<T extends FirestoreSerializable>
    implements FirestoreRepository<T> {
  final FirebaseFirestore firestore;
  final String _collectionPath;
  final T Function(Map<String, dynamic> data, String id) _fromDocFactory;

  FirestoreRepositoryImpl(
    this.firestore,
    this._collectionPath,
    this._fromDocFactory,
  );

  @override
  Future<String?> create(T entity) async {
    final data = entity.toJson();
    data.remove('id');
    final result = await firestore.collection(_collectionPath).add(data);
    return result.id;
  }

  @override
  Future<String?> createWithDocId(T entity, String id) async {
    final data = entity.toJson();
    data.remove('id');
    await firestore.collection(_collectionPath).doc(id).set(data);
    return id;
  }

  @override
  Future<T?> getById(String id) async {
    final result = await firestore.collection(_collectionPath).doc(id).get();
    final data = result.data();

    if (data == null) {
      return null;
    }

    return _fromDocFactory(data, id);
  }

  @override
  Future<List<T>> getAll([List<QueryPredicate> predicates = const []]) async {
    CollectionReference collection = firestore.collection(_collectionPath);
    Query query = collection;

    for (QueryPredicate predicate in predicates) {
      query = predicate.apply(query);
    }
    QuerySnapshot querySnapshot = await query.get();

    return querySnapshot.docs
        .map((doc) {
          final data = doc.data() as Map<String, dynamic>?;

          return data != null ? _fromDocFactory(data, doc.id) : null;
        })
        .where((entity) => entity != null)
        .map((entity) => entity!)
        .toList();
  }

  @override
  Future<void> update(String id, Map<String, dynamic> data) async {
    await firestore.collection(_collectionPath).doc(id).update(data);
  }
}
