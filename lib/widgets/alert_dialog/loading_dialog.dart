import 'package:flutter/material.dart';

class LoadingDialog<T> extends StatefulWidget {
  final Future<DialogResult<T>> Function() futureAction;
  final String message;
  const LoadingDialog({Key? key, required this.message, required this.futureAction}) : super(key: key);

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final result = await widget.futureAction();
      if (mounted) Navigator.of(context).pop(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Loading"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const Padding(padding: EdgeInsets.only(top: 16)),
          Text(widget.message),
        ],
      ),
    );
  }
}

class DialogResult<T> {
  bool isSuccess;
  String message;
  T? futureResult;

  bool get isFailed => !isSuccess;

  DialogResult({required this.isSuccess, required this.message, this.futureResult});
}
