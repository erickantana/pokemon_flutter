import 'dart:math';

import 'package:flutter/material.dart';

class ConfirmationDialog extends StatefulWidget {
  final String title;
  final String message;
  final void Function()? positiveAction;
  final void Function()? negativeAction;
  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.message,
    this.positiveAction,
    this.negativeAction,
  }) : super(key: key);

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title, style: const TextStyle(fontSize: 8)),
      content: Container(
        constraints: BoxConstraints(
          minWidth: min(MediaQuery.of(context).size.width, 192),
        ),
        child: Text(widget.message, style: const TextStyle(fontSize: 8)),
      ),
      actions: [
        ElevatedButton(
          child: const Text("Yes"),
          onPressed: () {
            widget.positiveAction?.call();
            if (mounted) Navigator.of(context).pop(true);
          },
        ),
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            widget.negativeAction?.call();
            if (mounted) Navigator.of(context).pop(false);
          },
        ),
      ],
      actionsPadding: const EdgeInsets.all(8),
    );
  }
}
