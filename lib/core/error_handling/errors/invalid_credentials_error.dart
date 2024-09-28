import 'package:flutter/material.dart';
import 'package:season_spot/core/error_handling/app_error.dart';
import 'package:season_spot/core/error_handling/error_presentation.dart';
import 'package:season_spot/core/localization/localization.dart';

class InvalidCredentialsError extends AppError {
  InvalidCredentialsError({super.presentation = ErrorPresentation.ui});

  @override
  String getLocalizedMessage(BuildContext context) {
    return context.translate.invalidCredentialsPleaseTryAgain;
  }
}
