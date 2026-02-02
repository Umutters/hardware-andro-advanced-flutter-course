import 'package:flutter/material.dart';

class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Widget')),
      body: const Center(child: Text('Hello, World!')),
    );
  }
}
