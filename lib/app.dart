import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:season_spot/shared/widgets/index.dart';

class App extends StatelessWidget {
  final GoRouter router;

  const App({super.key, required this.router});

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
