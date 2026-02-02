import 'package:flutter/material.dart';

class ContainerSizedboxLearn extends StatelessWidget {
  const ContainerSizedboxLearn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 200, height: 200, child: Text('a' * 20)),
            const SizedBox.shrink(),
            SizedBox.square(dimension: 50, child: Text('a' * 20)),
            SizedBox(height: 20),
            Container(
              decoration: ProjectUtility.boxDecoration,
              padding: const EdgeInsets.all(10),
              constraints: const BoxConstraints(
                maxWidth: 200,
                maxHeight: 200,
                minWidth: 2,
                minHeight: 2,
              ),
              child: Text('bb' * 1),
            ),
          ],
        ),
      ),
    );
  }
}
class ProjectUtility{
  static BoxDecoration boxDecoration =BoxDecoration(boxShadow: const [
                  BoxShadow(
                    color: Colors.red,
                    offset: Offset(0.5, 1),
                    blurRadius: 15,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,);
}
class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          boxShadow: const [
            BoxShadow(
              color: Colors.red,
              offset: Offset(0.5, 1),
              blurRadius: 15,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        );

}