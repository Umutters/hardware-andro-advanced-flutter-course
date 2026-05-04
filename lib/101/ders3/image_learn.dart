import 'package:flutter/material.dart';

class ImageLearn extends StatefulWidget {
  const ImageLearn({super.key});

  @override
  State<ImageLearn> createState() => _ImageLearnState();
}

class _ImageLearnState extends State<ImageLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.red,
                height: 300,
                width: 300,
                child: Image.asset(
                  "assets/images/MonaLisa.png",
                  fit: BoxFit.cover, // Resmi Container'a sığdır
                ),
              ),
              SizedBox(height: 10),
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Mona_Lisa.jpg/440px-Mona_Lisa.jpg",
                height: 300,
                width: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  "assets/images/MonaLisa.png",
                ), // Resmi Container'a sığdır
              ),
            ],
          ),
        ),
      ),
    );
  }
}
