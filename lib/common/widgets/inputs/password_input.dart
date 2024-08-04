
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:season_spot/theming/utils/app_icons.dart';
import 'package:season_spot/theming/utils/theme_extensions.dart';
import 'package:season_spot/theming/utils/app_rounding.dart';
import 'package:season_spot/theming/utils/app_typography_sizing.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  
  const PasswordInput({
    super.key,
    required this.controller,
    this.hint,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isTextObscured = false;

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
      controller: widget.controller,
      style: getTextStyle(context.theme.base.secondaryColor),
      obscureText: !isTextObscured,
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: context.theme.base.neutral200,
        hintStyle: getTextStyle(context.theme.base.neutral600),
        enabledBorder: getBorder(context.theme.base.neutral200),
        focusedBorder: getBorder(context.theme.base.neutral250),
        suffixIcon: IconButton( 
          icon: SvgPicture.asset(
            isTextObscured ? AppIcons.eyeSlash : AppIcons.eye,
            colorFilter: ColorFilter.mode(context.theme.base.neutral600, BlendMode.srcIn),
          ),
          onPressed: () => setState(() => isTextObscured = !isTextObscured), 
        ), 
      ),      
    );
  }
}
