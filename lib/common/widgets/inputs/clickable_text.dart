
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:season_spot/theming/utils/theme_extensions.dart';
import 'package:season_spot/theming/utils/app_typography_sizing.dart';

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
        recognizer: TapGestureRecognizer()
          ..onTap = () => onPressed,
      )
    );
  }
}