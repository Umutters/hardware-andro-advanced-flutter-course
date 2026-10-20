import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwa_learn/product/constants/duration_items.dart';
import 'package:hwa_learn/product/constants/lottie_items.dart';
import 'package:hwa_learn/product/global/theme_notifier.dart';
import 'package:lottie/lottie.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isLight = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: DurationItems.durationNormal(),
    );
  }

  void use() {
    _();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Learn'),
        actions: [
          InkWell(
            onTap: () async {
              await _controller.animateTo(_isLight ? 0 : 1);
              _isLight = !_isLight;
              Future.microtask(() {
                if (!mounted) return;

                context.read<ThemeNotifier>().changeTheme();
              });
            },
            child: Lottie.asset(
              LottieItems.themeChange.lottiePath,
              repeat: false,
            ),
          ),
        ],
      ),
      body: Center(child: _loadingLottie()),
    );
  }
}

LottieBuilder _loadingLottie() {
  return Lottie.asset(
    'assets/lotties/loading.json',
    options: LottieOptions(enableApplyingOpacityToLayers: true),
  );
}

int _() {
  return 5;
}
