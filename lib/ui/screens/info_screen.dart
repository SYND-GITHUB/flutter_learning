import 'package:flutter/material.dart';
import 'package:hello_flutter/resources/strings.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(INFO_PAGE),
          centerTitle: true,
        ),
        body: SingleChildScrollView(child: Container()));
  }
}
