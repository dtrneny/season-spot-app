
import 'package:flutter/widgets.dart';
import 'package:season_spot/core/validation/validation_rule.dart';

class EqualityValidationRule extends ValidationRule<String> {
  final String Function()? comparedValueBuilder;
  final String customMessage;

  EqualityValidationRule({required this.comparedValueBuilder, required this.customMessage});

  @override
  String? validate(BuildContext context, value) {
    final comparedValue = comparedValueBuilder?.call();
    
    if (value == null) { return null; }
    if (value != comparedValue) { return customMessage; }

    return null;
  }
}
