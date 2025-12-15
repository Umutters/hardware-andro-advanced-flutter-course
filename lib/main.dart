import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders8/tabbar_learn.dart';

import 'package:hwa_learn/dribble_examples/personal_finance_dashboard.dart';
//import 'package:hwa_learn/pageview_learn/pageview_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        tabBarTheme: TabBarThemeData(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TabBarLearn(),
    );
  }
}
