import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title, subTitle;
  final int rate;

  const TitleWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.rate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  Text(rate.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
