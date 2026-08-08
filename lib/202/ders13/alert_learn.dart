import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog<bool>(
            context: context,
            builder: (context) {
              return _ImageZoomDialog();
            },
          );
          if (response is bool) {
            response ? debugPrint("Update") : debugPrint("Not Update");
          }
        },
      ),
    );
  }
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({super.key, required BuildContext context})
    : super(
        title: const Text("version Update"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Update2'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      );
}

class _ImageZoomDialog extends StatelessWidget {
  final String _url = 'https://picsum.photos/200';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: Image.network(
          _url,
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
      ),
    );
  }
}
