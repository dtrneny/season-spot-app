import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

class IntroductionText extends StatelessWidget {
  final String text;

  const IntroductionText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: AppTypographySizing.base,
        color: context.theme.base.neutral600,
      ),
    );
  }
}
