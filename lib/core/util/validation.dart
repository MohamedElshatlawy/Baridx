import 'package:flutter/cupertino.dart';

import 'localization/app_localizations.dart';

class Validation {
  //-----------------------------------
  ///  Return KEYS FOR LOCALIZATION
  //-----------------------------------

  static String? requiredFieldValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.translate('field_required');
    }
    return null;
  }

  static String? phoneValidation(String? value, BuildContext context) {
    final RegExp phoneRegExp = RegExp(r'^\+?[0-9]{7,15}$');

    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.translate('field_required');
    } else if (!phoneRegExp.hasMatch(value)) {
      return AppLocalizations.of(
        context,
      )!.translate('enter_valid_phone_number');
    }
    return null;
  }

  static String? creditCardValidation(String? value, BuildContext context) {
    final RegExp cardRegExp = RegExp(r'^\d{13,19}$');

    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.translate('field_required');
    } else if (value.length < 13) {
      return AppLocalizations.of(context)!.translate('enter_min_13_digits');
    }
    String sanitized = value.replaceAll(RegExp(r'\s+|-'), '');
    if (!cardRegExp.hasMatch(sanitized)) {
      return AppLocalizations.of(context)!.translate('enter_valid_card_number');
    }
    int sum = 0;
    bool shouldDouble = false;
    for (int i = sanitized.length - 1; i >= 0; i--) {
      int digit = int.parse(sanitized[i]);
      if (shouldDouble) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      sum += digit;
      shouldDouble = !shouldDouble;
    }
    if (sum % 10 != 0) {
      return AppLocalizations.of(context)!.translate('enter_valid_card_number');
    }
    return null;
  }
}
