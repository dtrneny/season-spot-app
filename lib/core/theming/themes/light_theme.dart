
import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

final lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  fontFamily: 'Poppins',
  extensions: [
    BaseThemeExtension()
  ],
  scaffoldBackgroundColor: AppColors.neutral100,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.secondaryColor
  ),
);