import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitPianoWave(
      duration: Duration(milliseconds: 1200),
      color: Colors.blue,
      size: 50.0,
    );
  }
}
