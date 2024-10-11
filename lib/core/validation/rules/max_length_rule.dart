import 'package:flutter/widgets.dart';
import 'package:season_spot/core/localization/localization.dart';
import 'package:season_spot/core/validation/validation_rule.dart';

class MaxLengthRule extends ValidationRule<String> {
  final int max;

  MaxLengthRule({required this.max});

  @override
  String? validate(BuildContext context, value) {
    if (value == null) {
      return null;
    }

    if (value.length > max) {
      return context.translate.pleaseEnterNoMoreThanXCharacters(max);
    }

    return null;
  }
}
