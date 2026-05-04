import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Text(
            'Merhaba',
            style: Theme.of(context).textTheme.headlineLarge,
            overflow: TextOverflow.fade,
            maxLines: 1,
            textScaler: TextScaler.linear(1),
          ),
          Container(height: 500, color: Colors.red),
          const Divider(),
          SizedBox(
            height: 500,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(width: 300, color: Colors.green),
                const VerticalDivider(),
                Container(width: 300, color: Colors.blue),
                const VerticalDivider(),
                Container(width: 300, color: Colors.yellow),
              ],
            ),
          ),
          _ListDemo(),
        ],
      ),
    );
  }
}

class _ListDemo extends StatefulWidget {
  const _ListDemo({super.key});

  @override
  State<_ListDemo> createState() => __ListDemoState();
}

class __ListDemoState extends State<_ListDemo> {
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
