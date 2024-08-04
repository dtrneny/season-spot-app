
import 'package:flutter/material.dart';
import 'package:season_spot/theming/base_theme_extension.dart';

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension AppThemeExtension on ThemeData {
  BaseThemeExtension get base => extension<BaseThemeExtension>() ?? BaseThemeExtension();
}
