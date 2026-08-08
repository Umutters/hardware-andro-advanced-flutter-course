import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({super.key, this.onPressed});

  final bool Function(int number)? onPressed;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  //bana bir sayi gonder random ben bu sayiyi kontrol edipsana bir cevap vericem
  //bu cevaba gföre buton rengini güncellicem
  // doğru ise yesil yanlis ise kırmızı
  Color? _backGroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: _backGroundColor),
      onPressed: () {
        final result = Random().nextInt(10) + 1;
        final response = widget.onPressed?.call(result) ?? false;
        setState(() {
          _backGroundColor = response ? Colors.green : Colors.red;
        });
      },
      child: Text('Answer'),
    );
  }
}
