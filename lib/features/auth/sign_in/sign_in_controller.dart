
import 'package:season_spot/config/locator.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';
import 'package:season_spot/shared/toast/index.dart';

class SignInController {
  final auth = getIt.get<AuthService>();
  final toast = getIt.get<ToastController>();
}
