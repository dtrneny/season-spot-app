
import 'package:go_router/go_router.dart';
import 'package:season_spot/features/auth/sign_up/sign_up_screen.dart';
import 'package:season_spot/features/home/dashboard/home_screen.dart';
import 'package:season_spot/features/root/root_screen.dart';
import 'package:season_spot/features/auth/sign_in/sign_in_screen.dart';

List<RouteBase> routes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const RootScreen()
  ),
  GoRoute(
    path: '/sign-in',
    builder: (context, state) => const SignInScreen()
  ),
  GoRoute(
    path: '/sign-up',
    builder: (context, state) => const SignUpScreen()
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeScreen()
  )
];
