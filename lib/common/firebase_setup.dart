import 'package:firebase_core/firebase_core.dart';
import 'package:season_spot/firebase_options.dart';

class FirebaseSetup {
  static Future<void> init() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
}