import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hwa_learn/202/ders11/state_manage/state_manage_learn_view.dart';

abstract class StateManageLearnViewModel extends State<StateManageLearnView>
    with SingleTickerProviderStateMixin {
  bool isVisible = false;
  bool isOpacity = false;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: DurationUtils.durationLow,
    )..forward();

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
      controller.animateTo(isVisible ? 1 : 0);
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
}

class DurationUtils {
  static const durationLow = Duration(milliseconds: 500);
}
