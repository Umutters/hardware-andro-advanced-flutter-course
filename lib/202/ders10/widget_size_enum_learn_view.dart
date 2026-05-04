import 'package:flutter/material.dart';

class WidgetSizeEnumLearnView extends StatefulWidget {
  const WidgetSizeEnumLearnView({super.key});

  @override
  State<WidgetSizeEnumLearnView> createState() =>
      _WidgetSizeEnumLearnViewState();
}

class _WidgetSizeEnumLearnViewState extends State<WidgetSizeEnumLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          color: Colors.red,
          height: WidgetSize.medium.value,
          width: WidgetSize.medium.value,
        ),
      ),
    );
  }
}

enum WidgetSize { small, medium, large }

extension WidgetSizeExtension on WidgetSize {
  double get value {
    switch (this) {
      case WidgetSize.small:
        return 20;
      case WidgetSize.medium:
        return 50;
      case WidgetSize.large:
        return 100;
    }
  }

  /*  double value() {
    switch (this) {
      case WidgetSize.small:
        return 20;
      case WidgetSize.medium:
        return 50;
      case WidgetSize.large:
        return 100;
    }
  }*/ //böyle kullanımı olursa kullanırken widgetSize.medium.value() şeklinde olurdu. getter ile value'ya erişim sağlanır ve widgetSize.medium.value şeklinde kullanılır.
}
