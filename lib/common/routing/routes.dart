
import 'package:go_router/go_router.dart';
import 'package:season_spot/features/root/screens/root_screen.dart';
import 'package:season_spot/features/auth/screens/sign_in_screen.dart';

List<RouteBase> routes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const RootScreen()
  ),
  GoRoute(
    path: '/sign-in',
    builder: (context, state) => const SignInScreen()
  )
];
