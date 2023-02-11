import 'package:flutter/material.dart';

class InformationDialog extends StatelessWidget {
  final String title;
  final String message;
  const InformationDialog({Key? key, required this.title, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
