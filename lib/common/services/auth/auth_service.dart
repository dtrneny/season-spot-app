
import 'package:season_spot/common/error_handling/app_error.dart';
import 'package:season_spot/common/helpers/index.dart';
import 'package:season_spot/common/models/app_user/app_user.dart';

abstract class AuthService {
  Future<Result<AppUser, AppError>> signIn(String email, String password);
  Future<void> signOut();
  Future<Result<AppUser, AppError>> signUp(String email, String password);
  Future<AppUser?> getCurrentUser();
}
