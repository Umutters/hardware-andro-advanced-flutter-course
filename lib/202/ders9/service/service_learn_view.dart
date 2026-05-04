import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders9/service/comments_model.dart';
import 'package:dio/dio.dart';
import 'package:hwa_learn/202/ders9/service/service.dart';

class ServiceViewLearn extends StatefulWidget {
  const ServiceViewLearn({super.key});

  @override
  State<ServiceViewLearn> createState() => _ServiceViewLearnState();
}

class _ServiceViewLearnState extends State<ServiceViewLearn> {
  List<CommentsModel>? _items;
  bool _isLoading = false;
  late final Dio _networkManager;
  late final CommentService _commentService;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';
  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    _commentService = CommentService();
    fetchPost_itemsAdvanced();
  }

  Future<void> fetchPost_items() async {
    final response = await Dio().get(
      'https://jsonplaceholder.typicode.com/comments',
    );
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => CommentsModel.fromJson(e)).toList();
        });
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  void changeIsLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPost_itemsAdvanced() async {
    changeIsLoading();
    _items = await _commentService.fetchPostItemsAdvanced();
    changeIsLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Learn'),
        actions: [
          _isLoading
              ? const CircularProgressIndicator()
              : const SizedBox.shrink(),
        ],
      ),
      body: ListView.builder(
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return _CommentCard(model: _items![index]);
        },
      ),
    );
  }
}

class _CommentCard extends StatelessWidget {
  const _CommentCard({required this.model});

  final CommentsModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(model.name ?? ''),
        subtitle: Text(model.body ?? ''),
        leading: CircleAvatar(child: Text(model.id.toString())),
      ),
    );
  }
}
