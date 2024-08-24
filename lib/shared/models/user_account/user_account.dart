
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:season_spot/core/helpers/firestore_serializable.dart';

part 'user_account.freezed.dart';
part 'user_account.g.dart';

@freezed
class UserAccount with _$UserAccount implements FirestoreSerializable<UserAccount> {
  const UserAccount._(); 
  const factory UserAccount({
    String? id,
    required String firstname,
    required String lastname,
    required String email,
  }) = _UserAccount;

  factory UserAccount.fromJson(Map<String, dynamic> json) => _$UserAccountFromJson(json);

  @override
  UserAccount fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    if (data == null) { throw StateError('Missing data for document ID: ${doc.id}'); }
    return UserAccount.fromJson(data).copyWith(id: doc.id);
  } 
}