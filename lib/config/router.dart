
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:season_spot/config/locator.dart';
import 'package:season_spot/features/auth/sign_in/sign_in_screen.dart';
import 'package:season_spot/features/auth/sign_up/sign_up_screen.dart';
import 'package:season_spot/features/home/dashboard/dashboard_screen.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';
import 'package:season_spot/shared/widgets/index.dart';

class AppRouter {
  final AuthService _authService = getIt.get<AuthService>();
  late final GoRouter router;

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  AppRouter() {
    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/sign-in',
      routes: _getRoutes(),
    );
  }

  List<RouteBase> _getRoutes() {
    return [
      GoRoute(
        path: '/sign-in',
        redirect: (BuildContext context, GoRouterState state) => _authService.getCurrentUser() != null
          ? '/dashboard'
          : null,
        builder: (context, state) => const SignInScreen()
      ),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) => const SignUpScreen()
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => RootLayout(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DashboardScreen()
            ),
          ),
          GoRoute(
            path: '/vendor-profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Center(
                child: Text('Vendor profile'),
              )
            ),
          ),
          GoRoute(
            path: '/product-map',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Center(
                child: Text('Product map'),
              )
            ),
          ),
          GoRoute(
            path: '/community-places',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Center(
                child: Text('Community places'),
              )
            ),
          ),
          GoRoute(
            path: '/notification-center',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Center(
                child: Text('Notification center'),
              )
            ),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Center(
                child: Text('Settings'),
              )
            ),
          ),
        ],
      ),
    ];
  }
}
