import 'package:flutter/material.dart';
import 'package:hwa_learn/101/ders3/image_learn.dart';
import 'package:hwa_learn/101/ders4/custom_widget_learn.dart';
import 'package:hwa_learn/101/ders4/row_column_learn.dart';
import 'package:hwa_learn/101/ders4/stack_learn.dart';
import 'stateful_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  PageController pageController = PageController(viewportFraction: 0.9);
  int _currentPageIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        onPageChanged: _onPageChanged,
        controller: pageController,
        children: [StackLearn(), RowColumnLearn(), ImageLearn()],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              _currentPageIndex.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Spacer(),
          CustomButton(
            title: "Previous",
            onPressed: () {
              pageController.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.fastEaseInToSlowEaseOut,
              );
            },
          ),
          SizedBox(width: 15),
          CustomButton(
            title: "Next",
            onPressed: () {
              pageController.nextPage(
                duration: Duration(seconds: 1),
                curve: Curves.slowMiddle,
              );
            },
          ),
        ],
      ),
    );
  }
}
