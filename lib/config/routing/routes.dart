
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:season_spot/features/auth/sign_up/sign_up_screen.dart';
import 'package:season_spot/features/home/dashboard/dashboard_screen.dart';
import 'package:season_spot/features/auth/sign_in/sign_in_screen.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';

List<RouteBase> getRoutes(AuthService auth) {
  return [
    GoRoute(
      path: '/sign-in',
      redirect: (BuildContext context, GoRouterState state) {
        final user = auth.getCurrentUser();

        if (user != null) { return '/home'; }

        return null; 
      },
      builder: (context, state) => const SignInScreen()
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignUpScreen()
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => DashboardScreen()
    )
  ];
}
