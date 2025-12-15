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
          shape: const CircularNotchedRectangle(),
          child: _MyTabBar(tabController: _tabController),
        ),
        floatingActionButton: FloatingActionButton(
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
      controller: _tabController,
      labelColor: Colors.white,
      tabs: _MyTabViews.values
          .map(
            (e) => Tab(
              text: e.name,
              icon: Icon(switch (e) {
                _MyTabViews.home => Icons.home,
                _MyTabViews.profiles => Icons.person,
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
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        Container(color: Colors.red),
        Container(color: Colors.blue),
        Container(color: Colors.green),
      ],
    );
  }
}

enum _MyTabViews { home, profiles, settings }
