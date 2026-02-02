import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  const TextLearnView({super.key});
  final String name = 'Umut';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ('Merhaba $name '),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: ProjectStyles.titleStyle.copyWith(
                fontSize: 36,
                color: ProjectColors.myColor,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.wavy,
              ),
            ),
            Text(
              'Merhaba Flutter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle titleStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: Colors.brown,
    wordSpacing: 2,
    letterSpacing: 2,
  );
}

class ProjectColors {
  static Color get myColor => Colors.yellow;
  static Color appColor = Colors.blue;
}
