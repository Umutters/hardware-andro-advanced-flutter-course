import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({super.key});
  final String _Title = 'Food';

  void onPressed() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomButton(title: _Title, onPressed: onPressed),
          SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CustomButton(title: _Title, onPressed: onPressed),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.onPressed2,
  });
  final String title;
  final void Function() onPressed; //== final VoidCallback onPressed;
  final VoidCallback? onPressed2;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: redColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      onPressed: onPressed2 ?? onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: white,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }
}

mixin _PaddingUtility {
  final EdgeInsets normalPadding = EdgeInsets.all(8.0);
  final EdgeInsets normalPadding2x = EdgeInsets.all(16.0);
}
mixin _ColorsUtility {
  final Color redColor = Colors.red;
  final Color white = Colors.white;
}
