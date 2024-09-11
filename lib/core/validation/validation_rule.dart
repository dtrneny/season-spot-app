import 'package:flutter/material.dart';

abstract class ValidationRule<T> {
  String? validate(BuildContext context, T? value);
}
