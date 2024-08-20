
import 'package:flutter/material.dart';
import 'package:season_spot/core/validation/index.dart';
import 'package:season_spot/core/theming/index.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final AutovalidateMode? validationMode;
  final List<ValidationRule<String>>? rules;
  final Function(String)? onChanged;
  
  const TextInput({
    super.key,
    required this.controller,
    this.hint,
    this.validationMode = AutovalidateMode.onUserInteraction,
    this.rules,
    this.onChanged,
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

  TextStyle getErrorTextStyle(Color color) {
    return TextStyle(
      fontSize: AppTypographySizing.small,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) => {
        if (onChanged != null) { onChanged!(value), }
      },
      style: getTextStyle(context.theme.base.secondaryColor),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: context.theme.base.neutral200,
        hintStyle: getTextStyle(context.theme.base.neutral600),
        enabledBorder: getBorder(context.theme.base.neutral200),
        focusedBorder: getBorder(context.theme.base.neutral250),
        errorBorder: getBorder(context.theme.base.error600),
        focusedErrorBorder: getBorder(context.theme.base.error600),
        errorStyle: getErrorTextStyle(context.theme.base.error600),
        errorMaxLines: 2,
      ),
      autovalidateMode: validationMode,
      validator: Validation.apply(
        context,
        rules ?? []
      ),    
    );
  }
}