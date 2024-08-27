import 'package:flutter/widgets.dart';
import 'package:fuji_film_recipe/l10n/arb/app_localizations.dart';

export 'package:fuji_film_recipe/l10n/arb/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
