import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders10/Theme/light_theme.dart';
import 'package:hwa_learn/202/ders10/theme_learn_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: LightTheme().lightTheme,
      /*ThemeData.dark().copyWith(
        inputDecorationTheme: const InputDecorationTheme(filled: true),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        appBarTheme: _appBarTheme,
        tabBarTheme: TabBarThemeData(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          headlineLarge: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: _elevatedButtonThemeData,
        bottomAppBarTheme: const BottomAppBarThemeData(
          shape: AutomaticNotchedShape(RoundedRectangleBorder()),
        ),
      ),*/
      home: ThemeLearnView(),
    );
  }
}

const AppBarTheme _appBarTheme = AppBarTheme(
  centerTitle: true,
  backgroundColor: Color.fromARGB(215, 98, 90, 90),
  elevation: 0,
  titleTextStyle: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
);
final ElevatedButtonThemeData _elevatedButtonThemeData =
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
