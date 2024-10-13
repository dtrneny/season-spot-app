import 'package:flutter/material.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/core/localization/localization.dart';

class AppError implements Exception {
  final PresentationType presentation;

  AppError({this.presentation = PresentationType.toast});

  String getLocalizedMessage(BuildContext context) {
    return context.translate.anErrorOccurredPleaseTryAgainLater;
  }
}
