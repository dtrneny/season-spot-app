
import 'package:flutter/material.dart';
import 'package:season_spot/theming/utils/theme_extensions.dart';
import 'package:season_spot/theming/utils/app_rounding.dart';
import 'package:season_spot/theming/utils/app_typography_sizing.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  
  
  const TextInput({
    super.key,
    required this.controller,
    this.hint,
  });

  OutlineInputBorder getBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1),
      borderRadius: BorderRadius.circular(AppRounding.base),
    );
  }

  TextStyle getTextStyle(Color color) {
    return TextStyle(
      fontSize: AppTypographySizing.base,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: getTextStyle(context.theme.base.secondaryColor),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: context.theme.base.neutral200,
        hintStyle: getTextStyle(context.theme.base.neutral600),
        enabledBorder: getBorder(context.theme.base.neutral200),
        focusedBorder: getBorder(context.theme.base.neutral250),
      ),        
    );
  }
}
