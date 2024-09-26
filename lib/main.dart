import 'package:flutter/material.dart';
import 'package:season_spot/app.dart';
import 'package:season_spot/config/dependencies.dart';
import 'package:season_spot/config/router.dart';

void main() async {
  await initDependecies();
  runApp(App(router: AppRouter().router));
}
