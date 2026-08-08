import 'package:flutter/material.dart';
import 'package:hwa_learn/303/reqres_resource/viewmodel/unknown_viewmodel.dart';

class UnknownView extends StatefulWidget {
  const UnknownView({super.key, required this.message});

  final String message;

  @override
  State<UnknownView> createState() => _UnknownViewState();
}

class _UnknownViewState extends UnknownViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? const CircularProgressIndicator() : null,
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(resources[index].name ?? ''),
            subtitle: Text(resources[index].year?.toString() ?? ''),
            leading: CircleAvatar(
              backgroundColor: resources[index].colorValue != 0xFFFFFFFF
                  ? Color(resources[index].colorValue)
                  : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
