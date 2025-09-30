import 'package:flutter/material.dart';

extension Translate on String {
  String translate() {
    final locale = Localizations.localeOf(context).languageCode;
    return StringValues.values[locale]?[this] ??
        StringValues.values["en"]?[this] ??
        this;
  }
}