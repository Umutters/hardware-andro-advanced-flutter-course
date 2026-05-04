import 'package:flutter/material.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({super.key, required this.controller});
  final TextEditingController? controller;
  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool _isVisible = true;
  final String _obscruingCharacter = "*";

  void _changeState() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: const [AutofillHints.password, AutofillHints.newPassword],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isVisible,
      obscuringCharacter: _obscruingCharacter,
      decoration: InputDecoration(
        suffixIcon: _visibilityIcon(),
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }

  IconButton _visibilityIcon() {
    return IconButton(
      onPressed: _changeState,
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.visibility_outlined),
        secondChild: const Icon(Icons.visibility_off_outlined),
        crossFadeState: _isVisible
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
