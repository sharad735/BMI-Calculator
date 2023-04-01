import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';


class IconCardWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  IconCardWidget({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 40.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: labeStyling,
        )
      ],
    );
  }
}
