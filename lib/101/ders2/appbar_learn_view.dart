import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppbarLearnView extends StatelessWidget {
  const AppbarLearnView({super.key});
  final String title = 'Appbar Learn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        //actionsPadding: EdgeInsets.only(right: 10),
        actionsIconTheme: IconThemeData(color: Colors.black, size: 30),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        //backgroundColor: Colors.transparent,
        //centerTitle: true,
        title: Text(
          title,
          //style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.white),
        ),
        elevation: 0,

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: Colors.white),
          ),
          const CircularProgressIndicator(color: Colors.white),
        ],
      ),
      body: Center(
        child: Text(
          'Appbar Example',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: Colors.yellow),
        ),
      ),
    );
  }
}
