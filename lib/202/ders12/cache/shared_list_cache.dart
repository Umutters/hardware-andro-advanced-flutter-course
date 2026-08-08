import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders12/cache/shared_cachle_learn.dart';
import 'package:hwa_learn/202/ders12/cache/shared_manager.dart';
import 'package:hwa_learn/202/ders12/cache/user_model.dart';
import 'package:hwa_learn/core/myFab.dart';
import 'package:url_launcher/url_launcher.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStates<SharedListCache> {
  final UserModelList _users = UserModelList();
  late final SharedManager _sharedManager;
  static const double _normalFontSize = 12;
  static const double _expandedFontSize = 13;
  int? pressedIndex;

  @override
  void initState() {
    super.initState();
    _sharedManager = SharedManager();
    initializeandload();
  }

  void initializeandload() async {
    await _sharedManager.init();
    await _initShared();
  }

  Future<void> _initShared() async {
    final cacheValue = _sharedManager.getStringList(SharedKeys.users);
    if (cacheValue != null) {
      setState(() {
        _users.users = cacheValue
            .map((e) => UserModel.fromJson(jsonDecode(e)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading ? CircularProgressIndicator() : null,
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyFab(
            tur: FabTur.remove,
            onPressed: () async {
              final result = await _sharedManager.removeValue(SharedKeys.users);
              if (mounted) {
                setState(() {
                  _users.users = UserModelList().users;
                });
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(result.$2)));
              }
            },
          ),
          const SizedBox(width: 8),
          MyFab(
            tur: FabTur.save,
            onPressed: () async {
              onLoading();
              final result = await _sharedManager.saveStringList(
                _users.users.map((e) => jsonEncode(e.toJson())).toList(),
                SharedKeys.users,
              );
              if (mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(result.$2)));
              }
              onLoading();
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.users.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text("${_users.users[index].name}"),
                    subtitle: Text("${_users.users[index].description}"),
                    trailing: InkWell(
                      onTap: () {
                        launchUrl(Uri.parse("${_users.users[index].url}"));
                      },
                      onLongPress: () {
                        setState(() {
                          pressedIndex = index;
                        });
                      },
                      onLongPressUp: () {
                        setState(() {
                          pressedIndex = null;
                        });
                      },

                      child: Text(
                        "${_users.users[index].url}",
                        style: context.textStyle.copyWith(
                          fontSize: getFontSize(index),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  double getFontSize(int index) {
    if (pressedIndex == index) {
      return _expandedFontSize;
    } else {
      return _normalFontSize;
    }
  }
}

class UserModelList {
  late List<UserModel> users;
  UserModelList() {
    users = [
      UserModel(
        name: "Umut",
        description: "Flutter Developer",
        url: "https://www.github.com/Umutters",
      ),
      UserModel(
        name: "Ethem",
        description: "laravel Developer",
        url: "https://www.github.com/ethemdemirkaya",
      ),
      UserModel(
        name: "Veli",
        description: "mobile Developer",
        url: "https://www.github.com/VB10",
      ),
    ];
  }
}

extension ContextExtension on BuildContext {
  TextStyle get textStyle =>
      Theme.of(this).textTheme.bodyMedium ?? const TextStyle();
}
