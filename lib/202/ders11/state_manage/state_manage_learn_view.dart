import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders11/state_manage/state_manage_learn_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({super.key});

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

class _StateManageLearnViewState extends StateManageLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedCrossFade(
          firstChild: Placeholder(),
          secondChild: SizedBox(),
          crossFadeState: isOpacity
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: DurationUtils.durationLow,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: changeOpacity),
    );
  }
}

class DurationUtils {
  static const durationLow = Duration(milliseconds: 500);
}
