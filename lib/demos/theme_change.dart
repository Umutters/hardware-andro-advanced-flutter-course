import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwa_learn/bloc_learn/bloc_states.dart';
import 'package:hwa_learn/bloc_learn/cubit_learn.dart';

class ThemeChange extends StatefulWidget {
  const ThemeChange({super.key});

  @override
  State<ThemeChange> createState() => _ThemeChangeState();
}

class _ThemeChangeState extends State<ThemeChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Change"),
        actions: [
          IconButton(
            onPressed: () {
              BlocBuilder<ThemeCubit, ThemeStates>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context.read<ThemeCubit>().changeTheme();
                    },
                    icon: const Icon(Icons.brightness_4_outlined),
                  );
                },
              );
            },
            icon: const Icon(Icons.brightness_4_outlined),
          ),
        ],
      ),
    );
  }
}
