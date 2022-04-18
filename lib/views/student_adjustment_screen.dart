import 'package:flutter/material.dart';
import 'package:hello_flutter/resources/strings.dart';
import 'package:hello_flutter/resources/widgets/custom_button_widget.dart';
import 'package:hello_flutter/resources/widgets/info_card_widget.dart';
import 'package:hello_flutter/resources/widgets/input_widget.dart';
import 'package:hello_flutter/views/info_screen.dart';

class StudentAdjustmentScreen extends StatefulWidget {
  const StudentAdjustmentScreen({Key? key}) : super(key: key);

  // 1. Create State
  // - BuildContext
  @override
  _StudentAdjustmentScreenState createState() =>
      _StudentAdjustmentScreenState();
}

class _StudentAdjustmentScreenState extends State<StudentAdjustmentScreen> {
  // 2. mounted = true

  TextEditingController? mathController,
      literatureController,
      englishController;
  double? averageMark;
  String? grade;

  // 3. Init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mathController = TextEditingController();
    literatureController = TextEditingController();
    englishController = TextEditingController();
  }

  // 4. Did change dependencies
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  // 5. Build
  @override
  Widget build(BuildContext context) {
    print("mounted = $mounted");
    return Scaffold(
        appBar: AppBar(
          title: Text(STUDENT_ADJUSTMENT),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                // TextField Math
                InputWidget(
                    lableText: MATH_SCORE,
                    hintText: MATH_HINT,
                    controller: mathController),
                // TextField Literature
                InputWidget(
                    lableText: LITERATURE_SCORE,
                    hintText: LITERATURE_HINT,
                    controller: literatureController),
                // TextField English
                InputWidget(
                    lableText: ENGLISH_SCORE,
                    hintText: ENGLISH_HINT,
                    controller: englishController),
                // Button Calculate
                CustomButtonWidget(
                    buttonText: ADJUSTMENT,
                    onPressed: () {
                      print("Pressed");
                      setState(() {
                        averageMark = (double.parse(mathController!.text) +
                                double.parse(literatureController!.text) +
                                double.parse(englishController!.text)) /
                            3;
                        grade = adjustStudent(mark: averageMark!);
                      });
                    }),
                // Card Information
                InfoCardWidget(
                  lable1: AVERAGE_SCORE,
                  averageMark: averageMark ?? 0,
                  lable2: GRADE,
                  grade: grade == null ? UNDEFINED : grade!,
                ),
                TextButton(
                    onPressed: () {
                      var route =
                          MaterialPageRoute(builder: (context) => InfoScreen());
                      Navigator.push(context, route);
                    },
                    child: Text(CHANGE_PAGE)),
              ],
            ),
          ),
        ));
  }

  // 6. Did update widget
  @override
  void didUpdateWidget(covariant StudentAdjustmentScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  // 7. Set state
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  // 8. Deactivate
  // Stop state
  @override
  void deactivate() {
    super.deactivate();
  }

  // 9. Dispose
  // Clear state
  @override
  void dispose() {
    super.dispose();
    mathController?.dispose();
    literatureController?.dispose();
    englishController?.dispose();
  }

  adjustStudent({required double mark}) {
    if (mark < 5) {
      return MARK_LOW;
    } else if (mark < 8) {
      return MARK_MEDIUM;
    } else {
      return MARK_HIGH;
    }
  }
}
