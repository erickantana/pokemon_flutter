import 'package:flutter/material.dart';

class KeyValuePair extends StatelessWidget {
  final String? stringKey;
  final String? stringValue;
  const KeyValuePair({Key? key, this.stringKey, this.stringValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          stringKey ?? "",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 4)),
        Text(stringValue ?? ""),
      ],
    );
  }
}
