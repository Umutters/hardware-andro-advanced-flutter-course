import 'package:flutter/material.dart';
import 'package:hwa_learn/202/ders9/service/comments_model.dart';
import 'package:hwa_learn/202/ders9/service/service.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  String? name;
  List<CommentsModel>? items;
  late final ICommentService _commentService;
  bool _isLoading = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  Future<void> sendPostItems(CommentsModel model) async {
    changeIsLoading();
    final response = await _commentService.sendPostItems(model);
    changeIsLoading();

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
  }

  @override
  void initState() {
    super.initState();
    _commentService = CommentService();
  }

  void changeIsLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
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
      body: Column(
        children: [
          TextField(
            controller: nameController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: bodyController,
            keyboardType: TextInputType.number,
            undoController: UndoHistoryController(),
            decoration: InputDecoration(
              labelText: 'Body',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: _isLoading
                ? null
                : () {
                    if (nameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        bodyController.text.isNotEmpty) {
                      final model = CommentsModel(
                        name: nameController.text,
                        email: emailController.text,
                        body: bodyController.text,
                      );
                      sendPostItems(model);
                    }
                  },
            child: Text('gönder '),
          ),
        ],
      ),
    );
  }
}
