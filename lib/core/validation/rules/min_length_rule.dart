import 'package:flutter/widgets.dart';
import 'package:season_spot/core/localization/localization.dart';
import 'package:season_spot/core/validation/validation_rule.dart';

class MinLengthRule extends ValidationRule<String> {
  final int min;

  MinLengthRule({required this.min});

  @override
  String? validate(BuildContext context, value) {
    if (value == null) {
      return null;
    }

    if (value.length < min) {
      return context.translate.pleaseEnterAtLeastXCharacters(min);
    }

    return null;
  }
}
