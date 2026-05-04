import 'package:flutter/material.dart';

class TabBarLearn extends StatefulWidget {
  const TabBarLearn({super.key});

  @override
  State<TabBarLearn> createState() => _TabBarLearnState();
}

class _TabBarLearnState extends State<TabBarLearn>
    with SingleTickerProviderStateMixin {
  final double _notchedvalue = 8.0;
  late final TabController _tabController = TabController(
    length: _MyTabViews.values.length,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchedvalue,
          shape: CircularNotchedRectangle(),
          child: _MyTabBar(tabController: _tabController),
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            _tabController.animateTo(
              _tabController.index = _MyTabViews.home.index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(bottom: _MyTabBar(tabController: _tabController)),
        body: _MyTabBarView(tabController: _tabController),
      ),
    );
  }
}

class _MyTabBar extends StatelessWidget implements PreferredSizeWidget {
  const _MyTabBar({super.key, required TabController tabController})
    : _tabController = tabController;

  final TabController _tabController;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelStyle: context.mediumTextSyle,
      controller: _tabController,
      labelColor: Colors.blue,
      tabs: _MyTabViews.values
          .map(
            (e) => Tab(
              text: e.labelName,
              icon: Icon(switch (e) {
                _MyTabViews.home => Icons.home,
                _MyTabViews.settings => Icons.settings,
              }),
            ),
          )
          .toList(),
    );
  }
}

class _MyTabBarView extends StatelessWidget {
  const _MyTabBarView({required TabController tabController})
    : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      //physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        Container(color: Colors.red),
        Container(color: Colors.green),
      ],
    );
  }
}

enum _MyTabViews { home, settings }

extension _MyTabViewsExtension on _MyTabViews {
  String get labelName => switch (this) {
    _MyTabViews.home => 'Home',
    _MyTabViews.settings => 'Settings',
  };
}

extension _contextExtension on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  TextStyle get mediumTextSyle => Theme.of(this).textTheme.titleMedium!;
}
