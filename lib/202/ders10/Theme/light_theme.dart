import 'package:flutter/material.dart';

class LightTheme {
  final _lightColors = _LightColors();
  late ThemeData lightTheme;
  LightTheme() {
    lightTheme = ThemeData(
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStatePropertyAll(Colors.greenAccent),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      textTheme: ThemeData.light().textTheme.copyWith(),
      buttonTheme: ButtonThemeData(
        buttonColor: _lightColors.primaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      colorScheme: ColorScheme.light(
        primary: _LightColors().primaryColor,
        secondary: _LightColors().ahrimanBlue,
      ),
    );
  }
}

class _LightColors {
  final Color primaryColor = const Color.fromARGB(255, 37, 5, 5);
  final Color ahrimanBlue = Color.fromRGBO(1, 23, 141, 171);
}
