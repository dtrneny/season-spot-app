
import 'package:season_spot/common/toast/toast_controller.dart';
import 'package:season_spot/common/locator.dart';
import 'package:season_spot/common/services/auth/auth_service.dart';

class SignInController {
  final auth = getIt.get<AuthService>();
  final toast = getIt.get<ToastController>();
}
