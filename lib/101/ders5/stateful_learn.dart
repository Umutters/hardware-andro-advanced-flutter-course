import 'package:flutter/material.dart';
import 'package:hwa_learn/core/counter_button.dart';
import 'package:hwa_learn/product/languages/language_items.dart';

class Statefullearn extends StatefulWidget {
  const Statefullearn({super.key});
  @override
  State<Statefullearn> createState() => _StatefullearnState();
}

class _StatefullearnState extends State<Statefullearn> {
  int counter = 0;
  bool isIncrement = false;

  void changeValue(bool isIncrement) {
    setState(() {
      counter = isIncrement ? counter + 1 : counter - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.purple, Colors.blue],
            tileMode: TileMode.mirror,
          ).createShader(bounds),
          child: Text(LanguageItems.welcomeTitle, style: TextStyle()),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              counter.toString(),
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontSize: 36),
            ),
            CounterButton(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          customButton(true, Icons.add),
          SizedBox(width: 18),
          customButton(false, Icons.remove),
        ],
      ),
    );
  }

  FloatingActionButton customButton(bool isIncrement, IconData icon) {
    print("build çalıştı");
    return FloatingActionButton(
      onPressed: () {
        changeValue(isIncrement);
      },
      child: Icon(icon),
    );
  }
}
