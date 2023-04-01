import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/bottom_btn.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String bmiResult;
  final String bmiResultText;
  final String bmiResultTextInterpretation;

  Result(
      {required this.bmiResult,
      required this.bmiResultText,
      required this.bmiResultTextInterpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: kTitleStyle,
            ),
          )),
          Expanded(
              flex: 5,
              child: ReusableColumnWidget(
                colour: activeCardColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmiResultText.toUpperCase(),
                        style: kResultStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kBMIStyle,
                      ),
                      Text(
                        bmiResultTextInterpretation,
                        style: kBodyStyle,
                        textAlign: TextAlign.center,
                      )
                    ]),
              )),
          BottomButton(
            btnTitle: 'RECALCULATE',
            push: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => inputPage())));
            }),
          )
        ],
      ),
    );
  }
}
