import 'package:flutter/material.dart';
import 'package:hwa_learn/101/ders7/changing_background_color_example.dart';
import 'package:hwa_learn/101/ders7/color_life_cycle.dart';
import 'package:hwa_learn/101/ders7/navigate_detail.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({super.key});

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn>
    with NavigatorManager2 {
  List<int> selectedItems = [];
  void addSelectedItems(int index, bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () async {
              final response = await navigatoToWidget2<bool>(
                NavigateDetail(isTrue: selectedItems.contains(index)),
                context,
              );
              if (response is bool) {
                addSelectedItems(index, response);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Placeholder(
                color: selectedItems.contains(index)
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        onPressed: () async {
          final response = await navigatoToWidget2<bool>(
            const NavigateDetail(),
            context,
          );
          if (response == true) {
            print("Geri dönüldü ve true geldi");
          }
        },
      ),
    );
  }
}
//mixin de kullanılabilir constructorsız yani mixin NavigatorManager bunuuda  navigatorManager de yanına mixin ile yazınca otomatik kullanılabilir

class NavigatorManager {
  void navigatoToWidget(Widget widget, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ),
    );
  }
}

mixin NavigatorManager2 {
  Future<T?> navigatoToWidget2<T>(Widget widget, BuildContext context) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ),
    );
  }
}
