import 'package:flutter/material.dart';

extension DarkMode on BuildContext {
  // ignore: non_constant_identifier_names
  bool get IsDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
