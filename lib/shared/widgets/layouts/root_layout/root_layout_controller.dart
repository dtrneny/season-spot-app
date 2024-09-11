
import 'package:season_spot/config/locator.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/shared/models/index.dart';
import 'package:season_spot/shared/repositories/firestore/firestore_repository_impl.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';
import 'package:season_spot/shared/toast/index.dart';

class RootLayoutController {
  final _auth = getIt.get<AuthService>();
  final _userAccountRepository = getIt.get<FirestoreRepositoryImpl<UserAccount>>();

  final toast = getIt.get<ToastController>();

  Future<Result<bool, AppError>> signOut() async {
    try {
      await _auth.signOut();
      return const Success(true);
    } on Exception {
      return Failure(AppError());    
    }
  }

  Future<Result<UserAccount?, AppError>> getUserAccount() async {
    try {
      final user = _auth.getCurrentUser();
      if (user == null) { return Failure(AppError()); }

      final account = await _userAccountRepository.getById(user.id);
      return Success(account);
    } on Exception {
      return Failure(AppError());
    }
  }
}
