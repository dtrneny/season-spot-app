
import 'package:go_router/go_router.dart';
import 'package:season_spot/config/routing/routes.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';

class AppRouter {
  final AuthService _authService;
  late final GoRouter router;

  AppRouter({required AuthService authService}) : _authService = authService {
    router = GoRouter(
      initialLocation: '/sign-in',
      routes: getRoutes(_authService),
    );
  }
}
