import 'package:flutter/widgets.dart';
import 'package:season_spot/common/validation/validation_rule.dart';
import 'package:season_spot/localization/localization.dart';

class RequiredValidationRule<T> extends ValidationRule<T> {
  @override
  String? validate(BuildContext context, value) {
    if (value == null) {
      return context.translate.pleaseDoNotLeaveThisFieldEmpty;
    }
    if (value is String && (value as String).isEmpty) {
      return context.translate.pleaseDoNotLeaveThisFieldEmpty;
    }

    return null;
  }
}