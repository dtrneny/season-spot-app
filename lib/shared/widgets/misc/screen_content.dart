import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

class ScreenContent extends StatelessWidget {
  final Widget child;

  const ScreenContent({ super.key, required this.child });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p28),
      child: child,
    );
  }
}