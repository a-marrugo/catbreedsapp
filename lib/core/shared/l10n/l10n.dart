import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// An extension on [BuildContext] to easily access localized strings.
extension AppLocalizationsX on BuildContext {
  /// Returns the [AppLocalizations] instance for the current context.
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
