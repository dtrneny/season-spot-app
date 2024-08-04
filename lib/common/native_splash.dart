
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void initSplashScreen() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
}

void disposeSplashScreen() {
  FlutterNativeSplash.remove();
}