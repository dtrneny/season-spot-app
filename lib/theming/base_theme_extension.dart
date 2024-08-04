import 'package:flutter/material.dart';
import 'package:season_spot/theming/utils/app_colors.dart';

class BaseThemeExtension extends ThemeExtension<BaseThemeExtension> {
  final Color primaryColor;
  final Color complementaryColor;
  final Color secondaryColor;
  final Color neutral100;
  final Color neutral200;
  final Color neutral250;
  final Color neutral600;

  BaseThemeExtension({
    this.primaryColor = AppColors.primaryColor,
    this.complementaryColor = AppColors.complementaryColor,
    this.secondaryColor = AppColors.secondaryColor,
    this.neutral100 = AppColors.neutral100,
    this.neutral200 = AppColors.neutral200,
    this.neutral250 = AppColors.neutral250,
    this.neutral600 = AppColors.neutral600,
  });

  @override
  BaseThemeExtension copyWith({
    Color? primaryColor,
    Color? complementaryColor,
    Color? secondaryColor,
    Color? neutral100,
    Color? neutral200,
    Color? neutral250,
    Color? neutral600,
  }) {
    return BaseThemeExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      complementaryColor: complementaryColor ?? this.complementaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      neutral100: neutral100 ?? this.neutral100,
      neutral200: neutral200 ?? this.neutral200,
      neutral250: neutral250 ?? this.neutral250,
      neutral600: neutral600 ?? this.neutral600,
    );
  }

  @override
  BaseThemeExtension lerp(covariant ThemeExtension<BaseThemeExtension>? other, double t) {
    if (other is! BaseThemeExtension) {
      return this;
    }

    return BaseThemeExtension(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      complementaryColor: Color.lerp(complementaryColor, other.complementaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      neutral100: Color.lerp(neutral100, other.neutral100, t)!,
      neutral200: Color.lerp(neutral200, other.neutral200, t)!,
      neutral250: Color.lerp(neutral250, other.neutral250, t)!,
      neutral600: Color.lerp(neutral600, other.neutral600, t)!,
    );
  }
}