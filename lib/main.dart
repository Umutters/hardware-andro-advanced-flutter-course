import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwa_learn/101/ders5/page_view_learn.dart';
import 'package:hwa_learn/202/ders10/Theme/light_theme.dart';
import 'package:hwa_learn/202/ders12/cache/deneme_list.dart';
import 'package:hwa_learn/202/ders12/cache/shared_cachle_learn.dart';
import 'package:hwa_learn/202/ders12/cache/shared_list_cache.dart';
import 'package:hwa_learn/202/ders13/alert_learn.dart';
import 'package:hwa_learn/202/ders13/sheet_learn.dart';
import 'package:hwa_learn/303/call_back_learn.dart';
import 'package:hwa_learn/303/part/part_of_learn.dart';
import 'package:hwa_learn/303/reqres_resource/view/unknown_view.dart';
import 'package:hwa_learn/bloc_learn/cubit_learn.dart';
import 'package:hwa_learn/demos/theme_change.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(create: (context) => ThemeCubit(), child: const MyApp()));
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
      home: const UnknownView(message: 'Hello'),
    );
  }
}
