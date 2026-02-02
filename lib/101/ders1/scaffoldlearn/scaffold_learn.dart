import 'package:flutter/material.dart';
import 'package:hwa_learn/101/ders1/scaffoldlearn/bottom_Sheet_page.dart';

class ScaffoldLearnView extends StatefulWidget {
  const ScaffoldLearnView({super.key});

  @override
  State<ScaffoldLearnView> createState() => _ScaffoldLearnViewState();
}

class _ScaffoldLearnViewState extends State<ScaffoldLearnView> {
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheetPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: const [
            DrawerHeader(child: Text('Header')),
            ListTile(title: Text('Item 1'), leading: Icon(Icons.home)),
            ListTile(title: Text('Item 2'), leading: Icon(Icons.settings)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      //bottomSheet: const Text('Bottom Sheet'),
      appBar: AppBar(
        title: const Text('Scaffold Learn'),
        centerTitle: false,
        actions: [
          IconButton(onPressed: _showBottomSheet, icon: Icon(Icons.info)),
        ],
      ),
      body: const Center(child: Text('Scaffold Learn Body')),
      bottomNavigationBar: Container(
        color: Colors.blue,
        height: 60,
        child: BottomNavigationBar(
          backgroundColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
