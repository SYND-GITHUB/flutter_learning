import 'package:flutter/material.dart';

class InfoCardWidget extends StatelessWidget {
  final String lable1, lable2, grade;
  final double averageMark;

  const InfoCardWidget(
      {Key? key,
      required this.lable1,
      required this.averageMark,
      required this.lable2,
      required this.grade})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(flex: 1, child: Text(lable1)),
                  Expanded(flex: 1, child: Text(averageMark.toStringAsFixed(1))),
                ],
              ),
              Row(
                children: [
                  Expanded(flex: 1, child: Text(lable2)),
                  Expanded(flex: 1, child: Text(grade.toString())),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
