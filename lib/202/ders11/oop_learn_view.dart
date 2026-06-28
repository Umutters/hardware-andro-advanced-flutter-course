import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders11/oop_learn.dart';

class OOPLearnView extends StatefulWidget {
  const OOPLearnView({super.key});

  @override
  State<OOPLearnView> createState() => _OOPLearnViewState();
}

class _OOPLearnViewState extends State<OOPLearnView> {
  FileDownload? fileDownload;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fileDownload = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fileDownload?.downloadItem(null);
        },
      ),
      appBar: AppBar(title: Text("OOP Learn")),
    );
  }
}
