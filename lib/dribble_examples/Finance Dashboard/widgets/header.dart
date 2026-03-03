import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "hi, jonathan",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "Welcome back!",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          _buildNotificationIcon(),
        ],
      ),
    );
  }
}

Widget _buildNotificationIcon() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      const Icon(Icons.notifications_none_outlined),
      Positioned(
        right: -4,
        top: -4,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
          child: const Text(
            "6",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
