import 'package:flutter/material.dart';
import 'package:hwa_learn/demos/color_demos_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({super.key});

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? _color;

  @override
  void didUpdateWidget(covariant ColorLifeCycleView oldWidget) {
    if (oldWidget != widget) {
      _color = null;
    }

    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _color = Colors.transparent;
              setState(() {});
            },
            icon: Icon(Icons.clear),
          ),
          IconButton(
            onPressed: () {
              _color = Colors.pink;
              setState(() {});
            },
            icon: Icon(Icons.crop_din_outlined, color: Colors.pink),
          ),
        ],
      ),
      body: Column(
        children: [
          Spacer(),
          Expanded(child: ColorDemoView(color: _color)),
        ],
      ),
    );
  }
}
