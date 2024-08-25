
import 'package:season_spot/shared/models/index.dart';

abstract class AuthService {
  Future<AppUser?> signIn(String email, String password);
  Future<void> signOut();
  Future<AppUser?> signUp(String email, String password);
  AppUser? getCurrentUser();
}
