

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:season_spot/core/utils/localization.dart';

class TestingPage extends StatelessWidget {
  void testingFunction() async {
    print("runned");
    CollectionReference ref = FirebaseFirestore.instance.collection("client");
    try {
      DocumentReference result = await ref.add({
        'name': "John Doe"
      });
      print("Document added with ID: ${result.id}");
    } catch (e) {
      print("Error adding document: $e");
    }
  }

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
              const Text("Font test Q6", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              Text(t(context).helloWorld),
              ElevatedButton(
                onPressed: () {
                  testingFunction();
                },
                child: const Text("FIREBASE test"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
