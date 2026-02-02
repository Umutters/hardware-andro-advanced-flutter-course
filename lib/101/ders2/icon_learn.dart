import 'package:flutter/material.dart';

class IconLearn extends StatelessWidget {
  IconLearn({super.key});
  final IconSizes iconSizes = IconSizes();
  @override+
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.favorite,
              size: IconSizes().iconSizeLarge,
              color: Colors.red,
            ),
            Icon(
              Icons.flutter_dash,
              size: IconSizes().iconSizeLarge,
              color: Colors.blueAccent,
            ),
            Icon(
              Icons.access_alarm,
              size: IconSizes().iconSizeLarge,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class IconSizes {
  final double iconSizeLarge = 80;
  final double iconSizeMedium = 60;
  final double iconSizeSmall = 40;
}
