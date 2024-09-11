import 'package:firebase_auth/firebase_auth.dart';
import 'package:season_spot/config/locator.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/shared/models/index.dart';
import 'package:season_spot/shared/repositories/firestore/firestore_repository_impl.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';
import 'package:season_spot/shared/toast/toast_controller.dart';

class SignUpController {
  final _auth = getIt.get<AuthService>();
  final _userAccountRepository =
      getIt.get<FirestoreRepositoryImpl<UserAccount>>();
  final toast = getIt.get<ToastController>();

  Future<Result<bool, AppError>> signUp(
    UserAccount data,
    String password,
  ) async {
    try {
      final user = await _auth.signUp(data.email, password);
      if (user == null) {
        return Failure(AppError());
      }

      final accountResult =
          await _userAccountRepository.createWithDocId(data, user.id);
      return Success(accountResult);
    } on Exception catch (e) {
      if (e is! FirebaseAuthException) {
        return Failure(AppError());
      }

      final error = switch (e.code) {
        "email-already-in-use" => EmailInUseError(),
        _ => AppError(),
      };

      return Failure(error);
    }
  }
}
