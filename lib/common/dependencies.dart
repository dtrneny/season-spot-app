

import 'package:season_spot/common/locator.dart';
import 'package:season_spot/common/native_splash.dart';
import 'package:season_spot/common/firebase_setup.dart';

Future<void> initDependecies() async {
  initSplashScreen();
  await FirebaseSetup.init();
  initGetIt();
  disposeSplashScreen();
}