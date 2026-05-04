import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders9/service/comments_model.dart';
import 'package:hwa_learn/202/ders9/service/service.dart';

class CommentsUpdateLearnView extends StatefulWidget {
  const CommentsUpdateLearnView({super.key});

  @override
  State<CommentsUpdateLearnView> createState() =>
      _CommentsUpdateLearnViewState();
}

class _CommentsUpdateLearnViewState extends State<CommentsUpdateLearnView> {
  late final CommentService _commentService;
  bool _isLoading = false;
  late final TextEditingController _postIdController;
  late final TextEditingController _idController;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final CommentsModel _commentsModel;

  @override
  void initState() {
    super.initState();
    _postIdController = TextEditingController();
    _idController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _commentService = CommentService();
    _commentsModel = CommentsModel();
  }

  Future<void> updateItem() async {
    changeIsLoading();
    final response = await _commentService.updateServiceItem(1, _commentsModel);

    if (!mounted) return;

    if (response) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Başarılı')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Başarısız')));
    }
    changeIsLoading();
  }

  void changeIsLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(hintText: 'id'),
            ),
            TextField(
              controller: _postIdController,
              decoration: InputDecoration(hintText: 'postId'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(hintText: 'email'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(hintText: 'name'),
            ),
            ElevatedButton(
              onPressed: () {
                updateItem();
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
