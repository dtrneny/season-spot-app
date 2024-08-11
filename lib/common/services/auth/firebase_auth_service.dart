
import 'package:season_spot/common/models/user/auth_user.dart';
import 'package:season_spot/common/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth;

  const FirebaseAuthService(this._firebaseAuth);

  @override
  Future<AuthUser?> signIn(String email, String password) async {
    final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    final user = userCredentials.user;

    if (user == null || user.email == null) { return null; }

    return AuthUser.fromUser(user);
  }

  @override
  Future<bool> signOut() async {
    await _firebaseAuth.signOut();
    return true;
  }

  @override
  Future<AuthUser?> signUp(String email, String password) async {
    final userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    final user = userCredentials.user;

    if (user == null || user.email == null) { return null; }

    return AuthUser.fromUser(user);
  }

  @override
  Future<AuthUser?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null || user.email == null) { return null; }

    return AuthUser.fromUser(user);
  }
}
