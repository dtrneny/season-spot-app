import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:season_spot/shared/models/index.dart';
import 'package:season_spot/shared/repositories/firestore/firestore_repository_impl.dart';
import 'package:season_spot/shared/repositories/user_account_repository.dart';
import 'package:season_spot/shared/repositories/vendor_account_repository.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';
import 'package:season_spot/shared/services/auth/firebase_auth_service_impl.dart';
import 'package:season_spot/shared/services/google_places_service/google_places_service.dart';
import 'package:season_spot/shared/services/google_places_service/google_places_service_impl.dart';
import 'package:season_spot/shared/toast/index.dart';

final getIt = GetIt.instance;

void initGetIt() {
  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  getIt.registerSingleton<AuthService>(FirebaseAuthServiceImpl(firebaseAuth));
  getIt.registerSingleton(ToastController());
  getIt.registerSingleton<FirestoreRepositoryImpl<UserAccount>>(
    UserAccountRepository(firestore),
  );
  getIt.registerSingleton<FirestoreRepositoryImpl<VendorAccount>>(
    VendorAccountRepository(firestore),
  );
  getIt.registerSingleton<GooglePlacesService>(
    GooglePlacesServiceImpl(),
  );
}
