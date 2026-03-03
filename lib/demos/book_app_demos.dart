import 'package:flutter/material.dart';

class BookAppDemos extends StatelessWidget {
  const BookAppDemos({super.key});
  final String _title = "Welcome to Book App";
  final String _description =
      "Discover a world of books at your fingertips. Explore, read, and enjoy your favorite titles with our Flutter Book App.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPaddings().defaultPadding,
        child: Column(
          children: [
            Align(alignment: Alignment.center, child: CustomImage()),
            CustomSizedBox(),
            CustomTitleWidget(title: _title),
            CustomSizedBox(),
            CustomDescriptionWidget(description: _description),
            CustomSizedBox(),
            Spacer(),
            ElevatedButton(onPressed: () {}, child: const Text("Get Started")),
            SizedBox(height: 20),
            TextButton(onPressed: () {}, child: Text('import notes')),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 20);
  }
}

class CustomDescriptionWidget extends StatelessWidget {
  const CustomDescriptionWidget({super.key, this.description});
  final String? description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description ?? '',
      textAlign: TextAlign.center,
      style: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(fontSize: 16, color: Colors.black54),
    );
  }
}

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagePaths.bookImage,
      width: 250,
      height: 250,
      fit: BoxFit.fill,
    );
  }
}

class ImagePaths {
  static const String bookImage = "assets/images/book_image.png";
}

class ProjectPaddings {
  final EdgeInsets defaultPadding = EdgeInsets.all(20);
}
