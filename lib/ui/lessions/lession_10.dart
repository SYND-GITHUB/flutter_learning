import 'package:flutter/material.dart';
import 'package:hello_flutter/ui/widgets/cover_image_widget.dart';
import 'package:hello_flutter/ui/widgets/description_widget.dart';
import 'package:hello_flutter/ui/widgets/icon_text_button_widget.dart';
import 'package:hello_flutter/ui/widgets/title_widget.dart';

class Lession10 extends StatefulWidget {
  const Lession10({Key? key}) : super(key: key);

  @override
  _Lession10State createState() => _Lession10State();
}

class _Lession10State extends State<Lession10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            /** Image **/
            CoverImageWidget(imageUrl: "assets/images/cover_image.jpeg"),

            /** Title **/
            TitleWidget(
                title: "Oeschinen Lake Campground",
                subTitle: "Kander, Switzerland",
                rate: 4),
            /** Buttons **/
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: IconTextButtonWidget(
                      onPress: () {
                        print("Click CALL");
                      },
                      iconData: Icons.call,
                      color: Colors.blue,
                      textButton: "CALL"),
                ),
                Expanded(
                  flex: 1,
                  child: IconTextButtonWidget(
                      onPress: () {
                        print("Click ROUTE");
                      },
                      iconData: Icons.navigation,
                      color: Colors.blue,
                      textButton: "ROUTE"),
                ),
                Expanded(
                  flex: 1,
                  child: IconTextButtonWidget(
                      onPress: () {
                        print("Click SHARE");
                      },
                      iconData: Icons.share,
                      color: Colors.blue,
                      textButton: "SHARE"),
                ),
              ],
            ),
            /** Description **/
            DescriptionWidget(
                description:
                    "Description sample. Description sample. Description sample. Description sample. Description sample. Description sample. Description sample. Description sample. Description sample. Description sample. Description sample. "),
          ],
        ),
      ),
    );
  }
}
