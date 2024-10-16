import 'package:flutter/material.dart';
import 'package:season_spot/core/validation/index.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/shared/widgets/index.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final AutovalidateMode validationMode;
  final List<ValidationRule<String>>? rules;

  const PasswordInput({
    super.key,
    required this.controller,
    this.hint,
    this.validationMode = AutovalidateMode.onUserInteraction,
    this.rules,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  var _isTextObscured = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: _getTextStyle(
        context.theme.base.secondaryColor,
        AppTypographySizing.base,
      ),
      obscureText: !_isTextObscured,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: context.theme.base.neutral200,
        hintStyle: _getTextStyle(
          context.theme.base.neutral600,
          AppTypographySizing.base,
        ),
        enabledBorder: _getBorder(context.theme.base.neutral200),
        focusedBorder: _getBorder(context.theme.base.neutral250),
        errorBorder: _getBorder(context.theme.base.error600),
        focusedErrorBorder: _getBorder(context.theme.base.error600),
        errorStyle: _getTextStyle(
          context.theme.base.error600,
          AppTypographySizing.small,
        ),
        suffixIcon: IconButton(
          icon: BaseIcon(
              icon: _isTextObscured ? AppIcons.eyeSlash : AppIcons.eye,
              color: context.theme.base.neutral600),
          onPressed: () => setState(() => _isTextObscured = !_isTextObscured),
        ),
        errorMaxLines: 2,
      ),
      autovalidateMode: widget.validationMode,
      validator: Validation.apply(context, widget.rules ?? []),
    );
  }

  OutlineInputBorder _getBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1),
      borderRadius: BorderRadius.circular(AppRounding.base),
    );
  }

  TextStyle _getTextStyle(Color color, double size) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }
}
