
import 'package:flutter/widgets.dart';
import 'package:season_spot/core/validation/validation_rule.dart';

class Validation {
  Validation._();

  static FormFieldValidator<T> apply<T>(
    BuildContext context,
    List<ValidationRule<T>> rules,
  ) {
    return (T? value) {
      for (final rule in rules) {
        final result = rule.validate(context, value);
        if (result != null) { return result; }
      }

      return null;
    };
  }
}
