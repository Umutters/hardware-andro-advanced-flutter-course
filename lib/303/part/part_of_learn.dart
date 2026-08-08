import 'package:flutter/material.dart';
part './part_appbar.dart';

class PartOfLearn extends StatefulWidget {
  const PartOfLearn({super.key});

  @override
  State<PartOfLearn> createState() => _PartOfLearnState();
}

class _PartOfLearnState extends State<PartOfLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _PartOfAppbar(),
      body: Center(
        child: Text('Part of Learn', style: context.partOfLearn.labelLarge),
      ),
    );
  }
}

extension PartOfLearnExtension on BuildContext {
  TextTheme get partOfLearn => Theme.of(this).textTheme;
}
