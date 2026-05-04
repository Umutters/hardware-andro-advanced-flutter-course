import 'package:flutter/material.dart';
import 'package:hwa_learn/demos/random_image.dart';
import 'package:hwa_learn/101/ders4/stack_learn.dart';

class StackViewDemo extends StatelessWidget {
  const StackViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(bottom: 20, child: RandomImage()),
                Positioned(
                  height: 50,
                  bottom: 0,
                  width: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Sipariş Ver'),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.deepOrange,
                    size: 40,
                  ),
                ),
                Positioned(top: 20, right: 20, child: buildNotificationRing(2)),
              ],
            ),
          ),
          Spacer(flex: 6),
        ],
      ),
    );
  }
}
