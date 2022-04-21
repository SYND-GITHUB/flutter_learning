import 'package:flutter/material.dart';

class IconTextButtonWidget extends StatelessWidget {
  final onPress;
  final IconData iconData;
  final Color color;
  final String textButton;

  const IconTextButtonWidget(
      {Key? key,
      required this.onPress,
      required this.iconData,
      required this.color,
      required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              iconData,
              color: color,
            ),
            SizedBox(height: 5,),
            Text(
              textButton.toUpperCase(),
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
