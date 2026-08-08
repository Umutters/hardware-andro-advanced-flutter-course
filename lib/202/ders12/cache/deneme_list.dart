import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders12/cache/shared_manager.dart';
import 'package:hwa_learn/202/ders12/cache/user_model.dart';

class DenemeSharedList extends StatefulWidget {
  const DenemeSharedList({super.key});

  @override
  State<DenemeSharedList> createState() => _DenemeSharedListState();
}

class _DenemeSharedListState extends State<DenemeSharedList> {
  SharedManager? _sharedManager;
  List<UserModel> _users = [];

  @override
  void initState() {
    super.initState();
    _sharedManager = SharedManager();
    initializeandload();
  }

  void initializeandload() async {
    await _sharedManager?.init();
    await _initShared();
  }

  Future<void> _initShared() async {
    final cacheValue = _sharedManager?.getStringList(SharedKeys.users);
    if (cacheValue != null) {
      setState(() {
        _users = cacheValue
            .map((e) => UserModel.fromJson(jsonDecode(e)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text(user.name ?? ""),
            subtitle: Text(user.description ?? ""),
          );
        },
      ),
    );
  }
}
