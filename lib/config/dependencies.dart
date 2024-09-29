import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:season_spot/config/locator.dart';
import 'package:season_spot/firebase_options.dart';

Future<void> initDependecies() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initGetIt();

  FlutterNativeSplash.remove();
}
