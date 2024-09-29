import 'package:flutter/widgets.dart';
import 'package:season_spot/core/validation/validation_rule.dart';
import 'package:season_spot/core/localization/localization.dart';

class PhoneNumberValidationRule extends ValidationRule<String> {
  @override
  String? validate(BuildContext context, value) {
    final RegExp phoneNumberRegex =
        RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');

    if (value == null) {
      return null;
    }
    if (!phoneNumberRegex.hasMatch(value)) {
      return context.translate.pleaseEnterAValidPhoneNumber;
    }

    return null;
  }
}
