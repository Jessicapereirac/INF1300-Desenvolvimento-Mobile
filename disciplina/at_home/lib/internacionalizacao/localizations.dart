import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'localization_delegate.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  Map<String, String> _localizationsStrings; // Mudança de String para Dynamic

  Future<bool> load() async {
    String jsonString =
    await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap =
    json.decode(jsonString); // Mudança de String para Dynamic

    _localizationsStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString()); // Remover toString
    });
    return true;
  }

  String translate(String key) {
    return _localizationsStrings[key];
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  AppLocalizationsDelegate();
}