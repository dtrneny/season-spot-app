import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationGetter on BuildContext {
  AppLocalizations get translate => AppLocalizations.of(this)!;
}
