import 'package:flutter/material.dart';

enum FabTur { save, remove }

class MyFab extends StatelessWidget {
  const MyFab({super.key, required this.tur, required this.onPressed});
  final FabTur tur;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: tur == FabTur.save
          ? const Icon(Icons.save)
          : const Icon(Icons.remove),
    );
  }
}
