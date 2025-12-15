import 'package:flutter/material.dart';
import 'package:hwa_learn/dribble_examples/widgets/header.dart';
import 'package:hwa_learn/dribble_examples/widgets/wallet_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const DashboardHeader(), WalletWidget()],
      ),
    );
  }
}
