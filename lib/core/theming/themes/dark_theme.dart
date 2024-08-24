
import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

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
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.neutral100,
    surfaceTintColor: AppColors.neutral100,
  ),
);

