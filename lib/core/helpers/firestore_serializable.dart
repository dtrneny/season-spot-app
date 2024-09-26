abstract class FirestoreSerializable<T> {
  Map<String, dynamic> toJson();
  FirestoreSerializable.fromDoc(Map<String, dynamic> data, String id);
}
