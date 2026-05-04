import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  const RandomImage({super.key, this.imageHeight, this.imageWidth});
  final String imageUrl = 'https://picsum.photos/200/300';
  final double? imageHeight;
  final double? imageWidth;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: imageHeight ?? 200,
      width: imageWidth ?? 300,
      fit: BoxFit.cover,
    );
  }
}
