import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final bool _obscureText;
  const OutlinedTextField({Key? key, this.controller, this.title, this.hintText, bool? obscureText})
      : _obscureText = obscureText ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text("$title", style: const TextStyle(fontWeight: FontWeight.bold)),
          const Padding(padding: EdgeInsets.only(top: 8)),
        ],
        TextField(
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.all(12),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(),
            ),
            isDense: true,
          ),
          controller: controller,
        ),
      ],
    );
  }
}
