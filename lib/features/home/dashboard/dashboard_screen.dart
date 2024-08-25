
import 'package:flutter/material.dart';
import 'package:season_spot/config/locator.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';
import 'package:season_spot/shared/widgets/index.dart';

class DashboardScreen extends StatelessWidget {
  final auth = getIt.get<AuthService>();

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home'),
            BaseButton(
              onPressed: () async => await auth.signOut(),
              child: const Text('Sign out')
            )
          ],
        ),
      )
    );
  }
}