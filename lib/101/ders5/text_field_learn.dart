import 'package:flutter/material.dart';

class TextFieldLearn extends StatelessWidget {
  TextFieldLearn({super.key});
  final FocusNode textFieldOne = FocusNode();
  final FocusNode textFieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, Colors.blue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds),
            child: TextField(
              // focusNode: textFieldOne,
              keyboardAppearance: Brightness.light,
              maxLength: 20,
              buildCounter:
                  (
                    context, {
                    required currentLength,
                    required isFocused,
                    maxLength,
                  }) {
                    int colorShade = ((currentLength / 2).ceil() * 100).clamp(
                      100,
                      900,
                    );
                    return _animatedContainer(colorShade, currentLength);
                  },
              decoration: _InputDecorations.emailInputDecoration,
              autofillHints: [AutofillHints.email],
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                print(value);
              },
            ),
          ),
          TextField(focusNode: textFieldTwo),
          TextFormField(
            decoration: InputDecoration(
              //filled: true,
              isDense: true,
              hintText: 'Şifrenizi giriniz',
              fillColor: Colors.blue,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.password, color: Colors.white),
            ),
            forceErrorText: 'Hata',
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value?.length == 1) {
                return 'En az 2 karakter girmelisiniz';
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int colorShade, int currentLength) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: Colors.green[colorShade],
      height: 40,
      width: currentLength * 10.0,
    );
  }
}

class _InputDecorations {
  static InputDecoration emailInputDecoration = InputDecoration(
    //filled: true,
    isDense: true,
    hint: Text('mailinizi giriniz'),
    fillColor: Colors.blue,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    labelText: 'E-mail',
    prefixIcon: Icon(Icons.email, color: Colors.white),
  );
}
