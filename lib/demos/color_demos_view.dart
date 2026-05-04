import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemoView extends StatefulWidget {
  const ColorDemoView({super.key, required this.color});
  final Color? color;
  @override
  State<ColorDemoView> createState() => _ColorDemoViewState();
}

class _ColorDemoViewState extends State<ColorDemoView> {
  final List<BottomNavigationBarItem> _bottomNavigationBarItem = [
    BottomNavigationBarItem(
      icon: _ColorContainer(color: Colors.red),
      label: "Kırmızı",
    ),
    BottomNavigationBarItem(
      icon: _ColorContainer(color: Colors.yellow),
      label: "Sarı",
    ),
    BottomNavigationBarItem(
      icon: _ColorContainer(color: Colors.blue),
      label: "Mavi",
    ),
  ];
  Color? _color;
  @override
  void initState() {
    super.initState();
    _color = widget.color ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemoView oldWidget) {
    super.didUpdateWidget(oldWidget);
    inspect(widget);
    if (oldWidget.color != widget.color && widget.color != null) {
      setState(() {
        _color = widget.color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItem,
        onTap: _changeBackgroundColor,
      ),
    );
  }

  void _changeBackgroundColor(int index) {
    setState(() {
      if (index == ColorItems.red.index) {
        _color = Colors.red;
      } else if (index == ColorItems.yellow.index) {
        _color = Colors.yellow;
      } else if (index == ColorItems.blue.index) {
        _color = Colors.blue;
      }
    });
  }
}

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(color: color, width: 10, height: 10);
  }
}

enum ColorItems { red, yellow, blue }
