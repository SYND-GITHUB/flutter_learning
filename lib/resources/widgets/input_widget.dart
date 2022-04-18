import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String lableText, hintText;
  final controller;

  const InputWidget(
      {Key? key,
      required this.lableText,
      required this.hintText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 20, bottom: 5),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: lableText,
            hintText: hintText),
        controller: controller,
      ),
    );
  }
}
