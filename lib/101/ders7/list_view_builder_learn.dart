import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({super.key});

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  late final List<CardModel> _items;
  @override
  void initState() {
    super.initState();
    _items = CardItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return CategoryCard(model: _items[index]);
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required CardModel model}) : _model = model;

  final CardModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow,
      margin: PaddingUtility().paddingAll,
      child: Column(
        children: [
          Container(
            margin: PaddingUtility().paddingTop,
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: PaddingUtility().borderRadius,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: PaddingUtility().borderRadius,
              ),
              child: Image.asset(_model.imagePath, fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: PaddingUtility().paddingAll,
            child: Row(
              children: [
                Text(_model.title),
                Spacer(),
                Text('\$${_model.price.toStringAsFixed(2)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaddingUtility {
  final paddingAll = const EdgeInsets.all(12.0);
  final paddingTop = const EdgeInsets.only(top: 12.0);
  final borderRadius = BorderRadius.circular(12);
}

class CardModel {
  final String title;
  final String imagePath;
  final double price;
  CardModel({
    required this.title,
    required this.imagePath,
    required this.price,
  });
}

class CardItems {
  late final List<CardModel> items;
  CardItems() {
    items = List.generate(
      5, // Number of items you want
      (index) => CardModel(
        title: 'Item $index', // Uses the current index (0, 1, 2...)
        imagePath: 'assets/images/MonaLisa.png',
        price: (index + 1) * 1.5, // Just generating a dummy price
      ),
    );
  }
}
