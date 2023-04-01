import 'package:flutter/material.dart';

class ReusableColumnWidget extends StatelessWidget {
  final Color colour;
  final cardChild;
  final void Function() ? onPress;

  ReusableColumnWidget({required this.colour, this.cardChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,

      child: Container(
        child: cardChild, 
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
