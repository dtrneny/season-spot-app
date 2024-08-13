
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:season_spot/common/toast/toast_controller.dart';
import 'package:season_spot/common/services/auth/auth_service.dart';
import 'package:season_spot/common/services/auth/firebase_auth_service.dart';

final getIt = GetIt.instance;

void initGetIt() {
  final firebaseAuth = FirebaseAuth.instance;
  getIt.registerSingleton<AuthService>(FirebaseAuthService(firebaseAuth));
  getIt.registerSingleton(ToastController());
}