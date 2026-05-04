import 'package:flutter/material.dart';

class ColorView extends StatefulWidget {
  const ColorView({super.key, required this.initialColor});
  final Color initialColor;
  @override
  State<ColorView> createState() => _ColorViewState();
}

class _ColorViewState extends State<ColorView> {
  Color backgroundColor = Colors.transparent;

  Color changeBackgroundColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
    return backgroundColor;
  }

  @override
  void initState() {
    super.initState();
    backgroundColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        selectedLabelStyle: const TextStyle(color: Colors.white),
        backgroundColor: Colors.grey,
        onTap: bnaOnTap,
        items: [
          BottomNavigationBarItem(
            icon: createContainer(Colors.red),
            label: 'red',
          ),
          BottomNavigationBarItem(
            icon: createContainer(Colors.green),
            label: 'green',
          ),
          BottomNavigationBarItem(
            icon: createContainer(Colors.blue),
            label: 'blue',
          ),
        ],
      ),
    );
  }

  void bnaOnTap(int index) {
    if (ColorItems.blue.index == index) {
      changeBackgroundColor(Colors.blue);
    } else if (ColorItems.red.index == index) {
      changeBackgroundColor(Colors.red);
    } else if (ColorItems.green.index == index) {
      changeBackgroundColor(Colors.green);
    }
  }
}

Widget createContainer(Color color) {
  return Container(width: 10, height: 10, color: color);
}

enum ColorItems { red, green, blue }
