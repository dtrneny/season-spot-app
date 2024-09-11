import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Drawer? drawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const BaseScreen({
    super.key,
    required this.child,
    this.appBar,
    this.drawer,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      drawer: drawer,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: child,
      ),
    );
  }
}
