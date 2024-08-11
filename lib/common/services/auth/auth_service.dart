
import 'package:season_spot/common/models/user/auth_user.dart';

abstract class AuthService {
  Future<AuthUser?> signIn(String email, String password);
  Future<void> signOut();
  Future<AuthUser?> signUp(String email, String password);
  Future<AuthUser?> getCurrentUser();
}
