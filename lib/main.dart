import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:season_spot/config/dependencies.dart';
import 'package:season_spot/config/routing/router.dart';
import 'package:season_spot/shared/widgets/misc/toast_wrapper.dart';
import 'package:season_spot/core/theming/index.dart';

void main() async {
  await initDependecies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: _toastBuilder,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }

  Widget _toastBuilder(BuildContext context, Widget? child) {
    return ToastWrapper(
      child: child ?? const SizedBox.shrink(),
    );
  }
}
