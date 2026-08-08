import 'dart:convert';

import 'package:hwa_learn/202/ders12/cache/shared_manager.dart';
import 'package:hwa_learn/202/ders12/cache/user_model.dart';

class UserCacheManager {
  late final SharedManager sharedManager;
  void saveUserList(List<UserModel> users) {
    final userList = users.map((e) => jsonEncode(e)).toList();
    sharedManager.saveStringList(userList, SharedKeys.users);
  }

  List<UserModel>? getUserList() {
    final users = sharedManager.getStringList(SharedKeys.users);
    if (users?.isNotEmpty ?? false) {
      return users?.map((e) => UserModel.fromJson(jsonDecode(e))).toList();
    } else {
      return [];
    }
  }
}
