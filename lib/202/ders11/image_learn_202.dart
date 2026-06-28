import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImagePaths.MonaLisa.toWidget(height: 300, width: 300),
    );
  }
}

enum ImagePaths {
  // ignore: constant_identifier_names
  book_image,
  // ignore: constant_identifier_names
  MonaLisa,
}

extension ImagePathsExtension on ImagePaths {
  String path(String name) {
    return "assets/images/$name.png";
  }

  String get pathh => "assets/images/$name.png";

  Widget toWidget({double height = 200, double width = 200}) {
    return Image.asset(
      path(name),
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }
}
