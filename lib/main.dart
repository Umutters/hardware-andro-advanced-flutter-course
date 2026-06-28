import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders10/Theme/light_theme.dart';
import 'package:hwa_learn/202/ders12/cache/shared_cachle_learn.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const SharedCacheLearn(),
    );
  }
}
