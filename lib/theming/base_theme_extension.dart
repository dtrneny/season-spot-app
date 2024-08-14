import 'package:flutter/material.dart';
import 'package:season_spot/theming/index.dart';

class BaseThemeExtension extends ThemeExtension<BaseThemeExtension> {
  final Color primaryColor;
  final Color complementaryColor;
  final Color secondaryColor;
  final Color neutral100;
  final Color neutral200;
  final Color neutral250;
  final Color neutral600;
  final Color error600;
  final Color warning600;
  final Color success600;
  final Color info600;


  BaseThemeExtension({
    this.primaryColor = AppColors.primaryColor,
    this.complementaryColor = AppColors.complementaryColor,
    this.secondaryColor = AppColors.secondaryColor,
    this.neutral100 = AppColors.neutral100,
    this.neutral200 = AppColors.neutral200,
    this.neutral250 = AppColors.neutral250,
    this.neutral600 = AppColors.neutral600,
    this.error600 = AppColors.error600,
    this.warning600 = AppColors.warning600,
    this.success600 = AppColors.success600,
    this.info600 = AppColors.info600,

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
    Color? error600,
    Color? warning600,
    Color? success600,
    Color? info600,
  }) {
    return BaseThemeExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      complementaryColor: complementaryColor ?? this.complementaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      neutral100: neutral100 ?? this.neutral100,
      neutral200: neutral200 ?? this.neutral200,
      neutral250: neutral250 ?? this.neutral250,
      neutral600: neutral600 ?? this.neutral600,
      error600: error600 ?? this.error600,
      warning600: warning600 ?? this.warning600,
      success600: success600 ?? this.success600,
      info600: info600 ?? this.info600,
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
      error600: Color.lerp(error600, other.error600, t)!,
      warning600: Color.lerp(warning600, other.warning600, t)!,
      success600: Color.lerp(success600, other.success600, t)!,
      info600: Color.lerp(info600, other.info600, t)!,
    );
  }
}