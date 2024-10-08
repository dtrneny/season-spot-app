import 'package:firebase_auth/firebase_auth.dart';
import 'package:season_spot/config/locator.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/screen_handling/index.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';
import 'package:season_spot/shared/toast/index.dart';

class SignInController extends ScreenController {
  final _auth = getIt.get<AuthService>();
  final toast = getIt.get<ToastController>();

  Future<bool> signIn({
    String key = 'signIn',
    required String email,
    required String password,
  }) async {
    try {
      startLoading(key, LoadingType.ui);
      final user = await _auth.signIn(email, password);
      stopLoading(key);

      return user != null;
    } on Exception catch (e) {
      stopLoading(key);
      if (e is! FirebaseAuthException) {
        emitError(AppError());
        return false;
      }

      final error = switch (e.code) {
        "invalid-credential" => InvalidCredentialsError(),
        _ => AppError(),
      };

      emitError(error);
      return false;
    }
  }
}
