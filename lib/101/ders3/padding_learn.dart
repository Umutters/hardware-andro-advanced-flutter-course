import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: PaddingState.normalPadding,
            child: Container(
              alignment: Alignment.center,
              height: 100,
              color: Colors.red,
              width: double.infinity,
              child: Text("data", textAlign: TextAlign.center),
            ),
          ),
          Padding(
            padding: PaddingState.normalPadding,
            child: Container(height: 100, color: Colors.green),
          ),
          Padding(
            padding: PaddingState.normalPadding,
            child: Container(height: 100, color: Colors.green),
          ),
          Padding(
            padding: PaddingState.normalPadding,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 100,
              color: Colors.green,
              width: double.infinity,
              child: Text("data"),
            ),
          ),
        ],
      ),
    );
  }
}

class PaddingState {
  static const EdgeInsetsGeometry normalPadding = EdgeInsets.symmetric(
    vertical: 8.0,
    horizontal: 16,
  );
}
