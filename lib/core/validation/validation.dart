import 'package:flutter/widgets.dart';
import 'package:season_spot/core/validation/validation_rule.dart';

class Validation {
  Validation._();

  static FormFieldValidator<T> apply<T>(
    BuildContext context,
    List<ValidationRule<T>> rules,
  ) {
    return (T? value) {
      return rules
          .map((rule) => rule.validate(context, value))
          .firstWhere((result) => result != null, orElse: () => null);
    };
  }
}
