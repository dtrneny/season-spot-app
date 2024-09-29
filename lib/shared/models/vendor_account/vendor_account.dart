import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:season_spot/core/helpers/firestore_serializable.dart';

part 'vendor_account.freezed.dart';
part 'vendor_account.g.dart';

@freezed
class VendorAccount
    with _$VendorAccount
    implements FirestoreSerializable<VendorAccount> {
  const VendorAccount._();
  const factory VendorAccount({
    String? id,
    required String bussinessName,
    required String email,
    required String phoneNumber,
  }) = _VendorAccount;

  factory VendorAccount.fromJson(Map<String, dynamic> json) =>
      _$VendorAccountFromJson(json);

  factory VendorAccount.fromDoc(Map<String, dynamic> data, String id) {
    return VendorAccount.fromJson(data).copyWith(id: id);
  }
}
