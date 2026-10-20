import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders10/Theme/light_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isDarkMode = false;
  ThemeData get themeMode =>
      !isDarkMode ? LightTheme().lightTheme : ThemeData.dark();

  void changeTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
