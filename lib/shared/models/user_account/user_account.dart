import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:season_spot/core/helpers/firestore_serializable.dart';

part 'user_account.freezed.dart';
part 'user_account.g.dart';

@freezed
class UserAccount
    with _$UserAccount
    implements FirestoreSerializable<UserAccount> {
  const UserAccount._();
  const factory UserAccount({
    String? id,
    required String firstname,
    required String lastname,
    required String email,
    String? vendorAccountId,
  }) = _UserAccount;

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);

  factory UserAccount.fromDoc(Map<String, dynamic> data, String id) {
    return UserAccount.fromJson(data).copyWith(id: id);
  }
}
