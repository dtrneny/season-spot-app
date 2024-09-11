import 'package:flutter/widgets.dart';
import 'package:season_spot/core/validation/validation_rule.dart';

class ErrorMessageRule extends ValidationRule<String> {
  final String? message;

  ErrorMessageRule({required this.message});

  @override
  String? validate(BuildContext context, value) {
    return message;
  }
}
