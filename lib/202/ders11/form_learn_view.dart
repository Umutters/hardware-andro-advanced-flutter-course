import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: "değer gir yaram",
              validator: FormFieldValidator().isNotEmpty,
            ),
            DropdownButtonFormField<String>(
              validator: FormFieldValidator().isNotEmpty,
              items: const [
                DropdownMenuItem(value: "A", child: Text("A")),
                DropdownMenuItem(value: "B", child: Text("B")),
                DropdownMenuItem(value: "C", child: Text("C")),
              ],
              onChanged: (value) {},
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() == true) {
                  print("Form geçerli");
                } else {
                  print("Form geçersiz");
                }
              },
              child: Text("Kaydet"),
            ),
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return data?.isNotEmpty == true ? null : "Boş geçilemez";
  }
}
