import 'package:firebase_auth/firebase_auth.dart';
import 'package:season_spot/config/locator.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';
import 'package:season_spot/shared/toast/index.dart';

class SignInController {
  final _auth = getIt.get<AuthService>();
  final toast = getIt.get<ToastController>();

  Future<Result<bool, AppError>> signIn(String email, String password) async {
    try {
      final user = await _auth.signIn(email, password);
      return user != null ? const Success(true) : Failure(AppError());
    } on Exception catch (e) {
      if (e is! FirebaseAuthException) {
        return Failure(AppError());
      }

      final error = switch (e.code) {
        "invalid-credential" => InvalidCredentialsError(),
        _ => AppError(),
      };

      return Failure(error);
    }
  }
}
