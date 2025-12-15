import 'package:flutter/material.dart';

class NavigateDetail extends StatefulWidget {
  const NavigateDetail({super.key, this.isTrue = false});
  final bool isTrue;
  @override
  State<NavigateDetail> createState() => _NavigateDetailState();
}

class _NavigateDetailState extends State<NavigateDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop(!widget.isTrue);
          },
          label: widget.isTrue == true
              ? const Text("False dön")
              : const Text("True dön"),
        ),
      ),
    );
  }
}
