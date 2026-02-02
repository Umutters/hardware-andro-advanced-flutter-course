import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders8/ders9/service/comments_model.dart';
import 'package:dio/dio.dart';

class ServiceViewLearn extends StatefulWidget {
  const ServiceViewLearn({super.key});

  @override
  State<ServiceViewLearn> createState() => _ServiceViewLearnState();
}

class _ServiceViewLearnState extends State<ServiceViewLearn> {
  List<CommentsModel> _commentsList = [];
  bool _isLoading = false;
  void fetchCommentItems() async {
    _changeLoading();
    Dio()
        .get('https://jsonplaceholder.typicode.com/comments')
        .then((response) {
          if (response.statusCode == HttpStatus.ok) {
            final datas = response.data;
            if (datas is List) {
              setState(() {
                _commentsList = datas
                    .map((e) => CommentsModel.fromJson(e))
                    .toList();
              });
            }
          }
        })
        .catchError((error) {
          debugPrint(error.toString());
        })
        .whenComplete(() => _changeLoading());
  }

  @override
  void initState() {
    super.initState();
    fetchCommentItems();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? Icon(Icons.abc) : Icon(Icons.done)],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        itemBuilder: (context, int index) {
          return CustomCard(model: _commentsList[index]);
        },
        itemCount: _commentsList.length,
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.model});
  final CommentsModel model;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.0),
      color: Colors.blue,
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        title: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                model.name ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              flex: 3,
              child: Text(
                model.email ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        subtitle: Text(
          model.body ?? '',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
    );
  }
}
