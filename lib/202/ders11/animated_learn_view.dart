import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController controller;
  late Animation<double> animation;
  MediaQueryData get _mediaQuery => MediaQuery.of(context);
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

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
      controller.animateTo(_isVisible ? 1 : 0);
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  //  Scaffold scaffold = Scaffold();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedCrossFade(
          alignment: Alignment.center,
          firstChild: Placeholder(),
          secondChild: SizedBox(),
          crossFadeState: _isVisible
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: DurationUtils.durationLow,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _changeVisible),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              opacity: _isOpacity
                  ? OpacitySettings.visible.indexValue
                  : OpacitySettings.invisible.indexValue,
              duration: DurationUtils.durationLow,
              child: Text("Title"),
            ),
            trailing: IconButton(
              onPressed: _changeOpacity,
              icon: Icon(Icons.delete),
            ),
          ),
          AnimatedDefaultTextStyle(
            style:
                (_isVisible
                    ? context.textTheme.bodyLarge
                    : context.textTheme.bodySmall) ??
                const TextStyle(),
            duration: DurationUtils.durationLow,
            child: Text("data"),
          ),
          AnimatedIcon(icon: AnimatedIcons.pause_play, progress: animation),
          AnimatedContainer(
            duration: DurationUtils.durationLow,
            margin: EdgeInsets.zero,
            height: _isVisible ? 200 : 100,
            width: _isVisible ? 200 : 100,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(_isVisible ? 0 : 100),
            ),
          ),
          Expanded(
            child: AnimatedList(
              itemBuilder: (context, index, animation) {
                return Text("aa gs");
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension ContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  /*
  TextTheme textTheme(){
    return Theme.of(this).textTheme;
    }
   */
}

class DurationUtils {
  static const durationLow = Duration(milliseconds: 500);
}

enum OpacitySettings { visible, invisible }

extension OpacitySettingsExtension on OpacitySettings {
  double get indexValue => index.toDouble();
}
