import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders9/service/service.dart';

class CommentsDeleteLearnView extends StatefulWidget {
  const CommentsDeleteLearnView({super.key});

  @override
  State<CommentsDeleteLearnView> createState() =>
      _CommentsDeleteLearnViewState();
}

class _CommentsDeleteLearnViewState extends State<CommentsDeleteLearnView> {
  late final CommentService _commentService;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _commentService = CommentService();
  }

  Future<void> deleteItem() async {
    changeIsLoading();
    final response = await _commentService.deleteServiceItem(1);

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
            TextField(),
            ElevatedButton(
              onPressed: () {
                deleteItem();
              },
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
