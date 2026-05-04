import 'package:flutter/material.dart';
import 'package:hwa_learn/demos/password_textfield.dart';

class ThemeLearnView extends StatefulWidget {
  const ThemeLearnView({super.key});

  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PasswordTextfield(controller: TextEditingController()),
          CheckboxListTile(
            value: true,
            onChanged: (deger) {},
            title: Text("data"),
          ),
        ],
      ),
    );
  }
}
