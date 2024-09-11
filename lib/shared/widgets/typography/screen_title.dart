import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

class ScreenTitle extends StatelessWidget {
  final String title;

  const ScreenTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: AppTypographySizing.medium,
        color: context.theme.base.primaryColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
