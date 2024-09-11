
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/shared/repositories/firestore/firestore_repository.dart';

abstract class FirestoreRepositoryImpl<T extends FirestoreSerializable> implements FirestoreRepository<T> {
  final FirebaseFirestore firestore;
  final String _collectionPath;
  final T Function(Map<String, dynamic> data, String id) _fromDocFactory;

  FirestoreRepositoryImpl(this.firestore, this._collectionPath, this._fromDocFactory);

  @override
  Future<bool> create(T entity) async {
    final data = entity.toJson();
    data.remove('id');
    await firestore.collection(_collectionPath).add(data);
    return true;
  }

  @override
  Future<bool> createWithDocId(T entity, String id) async {
    final data = entity.toJson();
    data.remove('id');
    await firestore.collection(_collectionPath).doc(id).set(data);
    return true;
  }

  @override
  Future<T?> getById(String id) async {
    final result = await firestore.collection(_collectionPath).doc(id).get();
    final data = result.data();

    if (data == null) { return null; }

    return _fromDocFactory(data, id);
  }
}
