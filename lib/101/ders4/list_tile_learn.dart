import 'package:flutter/material.dart';
import 'package:hwa_learn/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: ListTile(
            hoverColor: Colors.red,
            title: RandomImage(),
            subtitle: const Text('Subtitle'),
            leading: Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              color: Colors.red,
              child: const Icon(Icons.account_balance),
            ),
            trailing: const Icon(Icons.chevron_right),
            tileColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
