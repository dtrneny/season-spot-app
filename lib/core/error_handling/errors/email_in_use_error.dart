import 'package:flutter/material.dart';
import 'package:season_spot/core/error_handling/app_error.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/core/localization/localization.dart';

class EmailInUseError extends AppError {
  EmailInUseError({super.presentation = PresentationType.ui});

  @override
  String getLocalizedMessage(BuildContext context) {
    return context.translate.thisEmailAlreadyExistsPleaseTryADifferentOne;
  }
}
