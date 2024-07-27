import 'package:flutter/material.dart';
import 'package:season_spot/features/auth/controllers/sign_in_controller.dart';

class SignInScreen extends StatefulWidget {

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController _signInController = SignInController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
        stream: _signInController.counterStream,
        builder: (context, snapshot) {
          final counter = snapshot.data ?? 0;

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Counter: $counter"),
                ElevatedButton(
                  onPressed: () => _signInController.addToCounter(1),
                  child: const Text("Add 1"),
                )
              ],
            ),
          );
        },
      )
    );
  }
}