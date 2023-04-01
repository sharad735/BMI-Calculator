import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';

class BottomButton extends StatelessWidget {
  final String btnTitle;

  final void Function()? push;
  BottomButton({required this.btnTitle, this.push});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: push,
      child: Container(
        child: Center(
          child: Text(
            btnTitle,
            style: kLargeNumberStyle,
            textAlign: TextAlign.center,
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        color: bottomContainerColour,
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}