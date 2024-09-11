import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:season_spot/shared/models/user_account/user_account.dart';
import 'package:season_spot/shared/repositories/firestore/firestore_repository_impl.dart';

class UserAccountRepository extends FirestoreRepositoryImpl<UserAccount> {
  UserAccountRepository(FirebaseFirestore firestore)
      : super(firestore, 'user_accounts', UserAccount.fromDoc);
}
