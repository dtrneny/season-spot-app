
import 'package:season_spot/shared/models/app_user/app_user.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServiceImpl implements AuthService {
  final FirebaseAuth _firebaseAuth;

  const FirebaseAuthServiceImpl(this._firebaseAuth);

  @override
  Future<AppUser?> signIn(String email, String password) async {
    final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredentials.user;

    if (user == null) { return null; }

    return AppUser.fromUser(user);
  }

  @override
  Future<bool> signOut() async {
    await _firebaseAuth.signOut();
    return true;
  }

  @override
  Future<AppUser?> signUp(String email, String password) async {
    final userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredentials.user;

    if (user == null) { return null; }

    return AppUser.fromUser(user);
  }

  @override
  AppUser? getCurrentUser() {
    final user = _firebaseAuth.currentUser;
    if (user == null || user.email == null) { return null; }

    return AppUser.fromUser(user);
  }
}
