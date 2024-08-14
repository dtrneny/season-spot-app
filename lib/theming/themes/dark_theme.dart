
import 'package:flutter/material.dart';
import 'package:season_spot/theming/index.dart';

final ThemeData darkTheme = ThemeData(
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

