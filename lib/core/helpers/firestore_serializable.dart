import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreSerializable<T> {
  Map<String, dynamic> toJson();
  FirestoreSerializable.fromDoc(DocumentSnapshot doc);
}
