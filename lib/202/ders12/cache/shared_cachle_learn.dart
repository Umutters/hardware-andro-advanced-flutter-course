import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders12/cache/shared_manager.dart';
import 'package:hwa_learn/core/myFab.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends MyState<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



abstract class MyState<T extends StatefulWidget> extends State<T>{

}

class SharedCacheLearn extends StatefulWidget {
  const SharedCacheLearn({super.key});

  @override
  State<SharedCacheLearn> createState() => _SharedCacheLearnState();
}

class _SharedCacheLearnState extends LoadingStates<SharedCacheLearn> {
  late final SharedManager _manager;
  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _initializeAndLoad();
  }

  Future<void> _initializeAndLoad() async {
    await _manager.init();
    await _initShared();
  }

  Future<void> _initShared() async {
    final cacheValue = _manager.getString(SharedKeys.counter);
    if (cacheValue != null) {
      setState(() {
        _value = cacheValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyFab(tur: FabTur.save, onPressed: () {}),
          MyFab(tur: FabTur.remove, onPressed: () {}),
        ],
      ),
      appBar: AppBar(title: Text("{$_value}")),
      body: TextField(onChanged: changeValue),
    );
  }
}

abstract class LoadingStates<T extends StatefulWidget> extends State<T> {
  String _value = '';

  void changeValue(String newValue) {
    setState(() {
      _value = newValue;
    });
  }

  bool isLoading = false;

  void onLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
