import 'package:practice_flutter/app/common/constants/strings/string_values.dart';

extension Translate on String {
  String translate() {
    return StringValues.values["en"]?[this] ??
        this;
  }
}