import 'package:firebase_auth/firebase_auth.dart';
import 'package:season_spot/config/locator.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/screen_handling/index.dart';
import 'package:season_spot/shared/models/index.dart';
import 'package:season_spot/shared/repositories/firestore/firestore_repository_impl.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';
import 'package:season_spot/shared/toast/toast_controller.dart';

class SignUpController extends ScreenController {
  final _auth = getIt.get<AuthService>();
  final _userAccountRepository =
      getIt.get<FirestoreRepositoryImpl<UserAccount>>();
  final toast = getIt.get<ToastController>();

  Future<bool> signUp({
    String key = 'signUp',
    required UserAccount data,
    required String password,
  }) async {
    try {
      startLoading(key, LoadingType.ui);
      final user = await _auth.signUp(data.email, password);
      if (user == null) {
        stopLoading(key);
        return false;
      }
      final result =
          await _userAccountRepository.createWithDocId(data, user.id);
      stopLoading(key);

      return result;
    } on Exception catch (e) {
      stopLoading(key);
      if (e is! FirebaseAuthException) {
        emitError(AppError());
        return false;
      }

      final error = switch (e.code) {
        "email-already-in-use" => EmailInUseError(),
        _ => AppError(),
      };

      emitError(error);
      return false;
    }
  }
}
