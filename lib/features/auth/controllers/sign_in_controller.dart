
import 'package:season_spot/common/locator.dart';
import 'package:season_spot/common/services/auth/auth_service.dart';
import 'package:season_spot/common/toast/index.dart';

class SignInController {
  final auth = getIt.get<AuthService>();
  final toast = getIt.get<ToastController>();
}
