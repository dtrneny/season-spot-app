

import 'package:flutter/material.dart';
import 'package:season_spot/core/utils/localization.dart';

class TestingPage extends StatelessWidget {
  const TestingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Q6", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              Text(t(context).helloWorld),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Test 6"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
