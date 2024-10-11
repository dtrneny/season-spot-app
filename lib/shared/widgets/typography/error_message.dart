import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

class ErrorMessage extends StatelessWidget {
  final String error;

  const ErrorMessage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Text(
      error,
      style: TextStyle(color: context.theme.base.error600),
    );
  }
}
