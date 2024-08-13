

import 'package:flutter/material.dart';
import 'package:season_spot/common/error_handling/app_error.dart';
import 'package:season_spot/common/error_handling/error_presentation_enum.dart';
import 'package:season_spot/localization/localization.dart';

class EmailInUseError extends AppError {
  EmailInUseError({ super.presentation = ErrorPresentation.text });

  @override
  String getLocalizedMessage(BuildContext context) {
    return context.translate.thisEmailAlreadyExistsPleaseTryADifferentOne;
  }
}