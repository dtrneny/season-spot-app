
import 'package:season_spot/core/error_handling/app_error.dart';
import 'package:season_spot/core/error_handling/errors/index.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/shared/models/app_user/app_user.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth;

  const FirebaseAuthService(this._firebaseAuth);

  @override
  Future<Result<AppUser, AppError>> signIn(String email, String password) async {
    try {
      final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredentials.user;

      if (user == null) { return Failure(AppError()); }

      return Success(AppUser.fromUser(user));

    } on Exception catch(e) {
      if (e is! FirebaseAuthException) { return Failure(AppError()); }

      switch (e.code) {
        case "invalid-credential": return Failure(InvalidCredentialsError());
        default: return Failure(AppError());
      }      
    }
  }

  @override
  Future<bool> signOut() async {
    await _firebaseAuth.signOut();
    return true;
  }

  @override
  Future<Result<AppUser, AppError>> signUp(String email, String password) async {
    try {
      final userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredentials.user;

      if (user == null) { return Failure(AppError()); }

      return Success(AppUser.fromUser(user));

    } on Exception catch(e) {
      if (e is! FirebaseAuthException) { return Failure(AppError()); }

      switch (e.code) {
        case "email-already-exists": return Failure(EmailInUseError());
        default: return Failure(AppError());
      }      
    }
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null || user.email == null) { return null; }

    return AppUser.fromUser(user);
  }
}
