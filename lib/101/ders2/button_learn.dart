import 'package:flutter/material.dart';

class Buttonlearn extends StatelessWidget {
  const Buttonlearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {},
              child: Text('Text Button'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.green;
                  }
                  return Colors.blue;
                }),
              ),
              onPressed: () {},
              child: Text('Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('Outlined Button'),
              style: OutlinedButton.styleFrom().copyWith(
                side: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return BorderSide(color: Colors.red, width: 2);
                  }
                  return BorderSide(color: Colors.blue, width: 2);
                }),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
            InkWell(child: Text(' InkWell '), onTap: () {}),
            Container(color: Colors.purple, height: 100),
            ElevatedButton(onPressed: () {}, child: Text("data")),
          ],
        ),
      ),
    );
  }
}

//borders:
//CircleBorder(),RoundedRectangleBorder(),StadiumBorder()

// Not: WidgetState zaten Flutter'da tanımlı (material.dart içinde)
// WidgetStateProperty.resolveWith() metodunu direkt kullanabilirsiniz
