import 'package:flutter/material.dart';

class LightTheme {
  final _lightColors = _LightColors();
  late ThemeData lightTheme;
  LightTheme() {
    lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(215, 98, 90, 90),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
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
  final Color ahrimanBlue = const Color.fromRGBO(1, 23, 141, 171);
}
