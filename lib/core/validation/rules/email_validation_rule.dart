import 'package:flutter/widgets.dart';
import 'package:season_spot/core/validation/validation_rule.dart';
import 'package:season_spot/core/localization/localization.dart';

class EmailValidationRule extends ValidationRule<String> {
  @override
  String? validate(BuildContext context, value) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

    if (value == null) {
      return null;
    }
    if (!emailRegex.hasMatch(value)) {
      return context.translate.pleaseEnterAValidEmail;
    }

    return null;
  }
}
