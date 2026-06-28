import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders12/cache/shared_manager.dart';

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
        children: [myFab(FabTur.save), myFab(FabTur.remove)],
      ),
      appBar: AppBar(title: Text("{$_value}")),
      body: TextField(onChanged: _changeValue),
    );
  }

  FloatingActionButton myFab(FabTur tur) {
    (bool, String)? result;
    return FloatingActionButton(
      onPressed: () async {
        onLoading();
        if (tur == FabTur.save) {
          result = await _manager.saveString(_value, SharedKeys.counter);
          if (result != null && mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(result!.$2)));
          }
        } else {
          result = await _manager.removeValue(SharedKeys.counter);
          if (result != null && mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(result!.$2)));
          }
        }
        onLoading();
      },
      child: tur == FabTur.save ? Icon(Icons.save) : Icon(Icons.remove),
    );
  }
}

abstract class LoadingStates<T extends StatefulWidget> extends State<T> {
  String _value = '';

  void _changeValue(String newValue) {
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

enum FabTur { save, remove }
