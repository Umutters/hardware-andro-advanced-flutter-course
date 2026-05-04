import 'package:flutter/material.dart';

class LifeCycleLearn extends StatefulWidget {
  const LifeCycleLearn({super.key, required this.message});
  final String message;

  @override
  State<LifeCycleLearn> createState() => _LifeCycleLearnState();
}

class _LifeCycleLearnState extends State<LifeCycleLearn> {
  String _message = '';
  late final bool _isOdd;
  @override
  void initState() {
    super.initState();
    print('c');
    _message = widget.message;
    _isOdd = _message.length.isOdd;
    _checkIsOdd();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('a');
  }

  @override
  void didUpdateWidget(covariant LifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _checkIsOdd();
      print('b');
    }
  }

  void _checkIsOdd() {
    if (_isOdd) {
      _message += ' tek';
    } else {
      _message += ' çift';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Text(
          _message,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
