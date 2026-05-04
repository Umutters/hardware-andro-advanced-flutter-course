import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [_TitleWidget(), Text('Stateless Widget')]),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  _TitleWidget({super.key});
  String? title;

  set titleSet(String? value) => title = value;
  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? 'Stateless Learn',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
