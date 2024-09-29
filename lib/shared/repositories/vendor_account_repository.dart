import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:season_spot/shared/models/index.dart';
import 'package:season_spot/shared/repositories/firestore/firestore_repository_impl.dart';

class VendorAccountRepository extends FirestoreRepositoryImpl<VendorAccount> {
  VendorAccountRepository(FirebaseFirestore firestore)
      : super(firestore, 'vendor_accounts', VendorAccount.fromDoc);
}
