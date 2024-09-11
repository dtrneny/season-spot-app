import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ClickableText({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: AppTypographySizing.small,
          color: context.theme.base.primaryColor,
        ),
        recognizer: TapGestureRecognizer()..onTap = onPressed,
      ),
    );
  }
}
