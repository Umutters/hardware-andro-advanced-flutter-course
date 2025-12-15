import 'package:flutter/material.dart';
import 'package:hwa_learn/101/ders7/changing_background_color_example.dart';

class ColorLifeCycle extends StatefulWidget {
  const ColorLifeCycle({super.key});

  @override
  State<ColorLifeCycle> createState() => _ColorLifeCycleState();
}

class _ColorLifeCycleState extends State<ColorLifeCycle> {
  Color? _backGroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _backGroundColor = Colors.pink;
              });
            },
            icon: Icon(Icons.clear),
          ),
        ],
      ),
      body: Column(
        children: [
          Spacer(),
          Expanded(
            child: ColorView(initialColor: _backGroundColor ?? Colors.amber),
          ),
        ],
      ),
    );
  }
}
