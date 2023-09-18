import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  get themeMode => _themeMode;

  toggleTheme(bool isDarkModeEnabled) {
    _themeMode = isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
