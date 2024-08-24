
import 'package:season_spot/core/error_handling/app_error.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/shared/models/index.dart';

abstract class AuthService {
  Future<Result<AppUser, AppError>> signIn(String email, String password);
  Future<void> signOut();
  Future<AppUser?> signUp(String email, String password);
  Future<AppUser?> getCurrentUser();
}
