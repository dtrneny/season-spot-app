

import 'package:season_spot/core/locator.dart';
import 'package:season_spot/core/native_splash.dart';
import 'package:season_spot/common/services/firebase/firebase_service.dart';

Future<void> initDependecies() async {
  initSplashScreen();
  await FirebaseService.init();
  initGetIt();
  disposeSplashScreen();
}