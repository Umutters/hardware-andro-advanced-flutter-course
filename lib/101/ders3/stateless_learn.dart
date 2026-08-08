import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key, this.name});
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _TitleWidget('welcome ${name ?? 'guest'}'),
          Text('Stateless Widget'),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget(this.title);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? 'Stateless Learn',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
