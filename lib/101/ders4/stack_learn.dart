import 'package:flutter/material.dart';

class StackLearn extends StatefulWidget {
  const StackLearn({super.key});

  @override
  State<StackLearn> createState() => _StackLearnState();
}

class _StackLearnState extends State<StackLearn> {
  int _counter = 0;

  void _onPressed() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [buildNotificationRing(_counter)]),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _onPressed,
              child: Text('Counter: $_counter'),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildNotificationRing(int count) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Stack(
      children: [
        Icon(Icons.notifications, size: 40),
        Positioned(
          right: 15,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Center(
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
