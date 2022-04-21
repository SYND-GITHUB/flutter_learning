import 'package:flutter/material.dart';
import 'package:hello_flutter/ui/lessions/lession_10.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Raleway",
      ),
      home: Lession10(),
    );
  }
}
