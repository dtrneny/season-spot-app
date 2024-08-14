
import 'package:flutter/material.dart';
import 'package:season_spot/common/error_handling/error_presentation_enum.dart';
import 'package:season_spot/localization/localization.dart';

class AppError implements Exception {
  final ErrorPresentation presentation;

  AppError({ this.presentation = ErrorPresentation.toast });
  
  String getLocalizedMessage(BuildContext context) {
    return context.translate.anErrorOccurredPleaseTryAgainLater;
  }
}