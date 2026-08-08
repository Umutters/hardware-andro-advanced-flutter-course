import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key, this.onCall, this.title = 'Save'});
  final Future<void> Function()? onCall;
  final String title;
  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;
  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading
          ? null
          : () {
              if (_isLoading) return;
              _changeLoading();
              widget.onCall?.call().whenComplete(() {
                _changeLoading();
              });
            },
      child: _isLoading
          ? const CircularProgressIndicator()
          : Text(widget.title),
    );
  }
}
