import 'package:flutter/material.dart';

class AnimatedListExample extends StatefulWidget {
  const AnimatedListExample({super.key});

  @override
  State<AnimatedListExample> createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  late final GlobalKey<AnimatedListState> _listKey;
  late ListModel<int> _list;
  int? _selectedItem;
  late int
  _nextItem; // The next item inserted when the user presses the '+' button.

  @override
  void initState() {
    super.initState();
    _listKey = GlobalKey<AnimatedListState>();
    _list = ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
  }

  Widget _buildItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  Widget _buildRemovedItem(
    int item,
    BuildContext context,
    Animation<double> animation,
  ) {
    return CardItem(
      animation: animation,
      item: item,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  void _insert() {
    final int index = _selectedItem == null
        ? _list.length
        : _list.indexOf(_selectedItem!);
    _list.insert(index, _nextItem);
    _nextItem++;
  }

  // Remove the selected item from the list model.
  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem!));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedList'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: _insert,
            tooltip: 'insert a new item',
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle),
            onPressed: _remove,
            tooltip: 'remove the selected item',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _list.length,
          itemBuilder: _buildItem,
        ),
      ),
    );
  }
}

typedef RemovedItemBuilder<T> =
    Widget Function(T item, BuildContext context, Animation<double> animation);

class ListModel<T> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    Iterable<T>? initialItems,
  }) : _items = List<T>.from(initialItems ?? <T>[]);

  final GlobalKey<AnimatedListState> listKey;
  final RemovedItemBuilder<T> removedItemBuilder;
  final List<T> _items;

  AnimatedListState? get _animatedList => listKey.currentState;

  void insert(int index, T item) {
    _items.insert(index, item);
    _animatedList!.insertItem(index);
  }

  T removeAt(int index) {
    final T removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList!.removeItem(index, (
        BuildContext context,
        Animation<double> animation,
      ) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }

  int get length => _items.length;

  T operator [](int index) => _items[index];

  int indexOf(T item) => _items.indexOf(item);
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    this.onTap,
    this.selected = false,
    required this.animation,
    required this.item,
  }) : assert(item >= 0);

  final Animation<double> animation;
  final VoidCallback? onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headlineMedium!;
    if (selected) {
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    }
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        sizeFactor: animation,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: SizedBox(
            height: 80.0,
            child: Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: Center(child: Text('Item $item', style: textStyle)),
            ),
          ),
        ),
      ),
    );
  }
}
