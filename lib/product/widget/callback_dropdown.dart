import 'package:flutter/material.dart';

class CallbackDropDown extends StatefulWidget {
  const CallbackDropDown({super.key, required this.onUserSelected});

  final void Function(CallBackUser user) onUserSelected;

  @override
  State<CallbackDropDown> createState() => _CallbackDropDownState();
}

class _CallbackDropDownState extends State<CallbackDropDown> {
  CallBackUser? _user;

  void _updateUser(CallBackUser? user) {
    setState(() {
      _user = user;
    });
    if (user != null) {
      widget.onUserSelected.call(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallBackUser>(
      value: _user,
      items: CallBackUser.userList().map((e) {
        return DropdownMenuItem<CallBackUser>(value: e, child: Text(e.name));
      }).toList(),
      onChanged: _updateUser,
    );
  }
}

class CallBackUser {
  final String name;
  final int id;
  CallBackUser(this.name, this.id);

  static List<CallBackUser> userList() {
    return [
      CallBackUser('Ali', 1),
      CallBackUser('Veli', 2),
      CallBackUser('Ayşe', 3),
      CallBackUser('Fatma', 4),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallBackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
