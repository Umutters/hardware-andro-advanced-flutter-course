import 'package:flutter/material.dart';
import 'package:hwa_learn/product/button/answer_button.dart';
import 'package:hwa_learn/product/button/loading_button.dart';
import 'package:hwa_learn/product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: CallbackDropDown(onUserSelected: (user) {})),
          AnswerButton(
            onPressed: (number) {
              print(number);
              if (number % 2 == 0) {
                return true;
              }
              return false;
            },
          ),
          LoadingButton(
            onCall: () async {
              await Future.delayed(const Duration(seconds: 3));
            },
          ),
        ],
      ),
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
