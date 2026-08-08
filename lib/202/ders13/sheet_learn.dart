import 'package:flutter/material.dart';
import 'package:hwa_learn/101/ders6/listview_learn.dart';
import 'package:hwa_learn/demos/book_app_demos.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn>
    with ProductSheetMixin, SingleTickerProviderStateMixin {
  Color _backgroundColor = Colors.white;
  bool _isSheetOpen = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(title: const Text("Sheet Learn")),
      body: Center(
        child: TextButton(
          onPressed: () {
            showProductSheet(context, child: const ListViewLearn());
          },
          child: const Text("Press Me"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
            backgroundColor: _backgroundColor,
            barrierColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            context: context,
            builder: (context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: ShowSheet(isSheetOpen: _isSheetOpen),
              );
            },
          );
          if (result is bool) {
            setState(() {
              _isSheetOpen = result;
              _backgroundColor = result ? Colors.red : Colors.white;
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showProductSheet<T>(
    BuildContext context, {
    required Widget child,
  }) {
    return showModalBottomSheet<T>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      context: context,
      builder: (context) => _CustomMainSheet(child: child),
    );
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _BaseSheetHeader(),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class ShowSheet extends StatefulWidget {
  const ShowSheet({super.key, required bool isSheetOpen})
    : _isPressed = isSheetOpen;

  @override
  State<ShowSheet> createState() => _ShowSheetState();

  final bool _isPressed;
}

class _ShowSheetState extends State<ShowSheet> {
  late bool isPressed = widget._isPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.amber),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Hello"),
            CustomImage(imageHeight: 200),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isPressed = !isPressed;
                  isPressed
                      ? Navigator.of(context).pop(true)
                      : Navigator.of(context).pop(false);
                });
              },
              child: Text("Press Me"),
            ),
          ],
        ),
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader() : _gripHeight = 30;

  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Divider(
            color: Theme.of(context).colorScheme.onSurface,
            thickness: 3,
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.01,
            top: 0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: PAddingManager.paddingLowAll,
                child: Icon(Icons.close),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PAddingManager {
  static const paddingLowAll = EdgeInsets.all(8.0);
}
