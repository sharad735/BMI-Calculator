import 'package:flutter/material.dart';

class RoundActionButton extends StatelessWidget {
  final IconData? icon;
  final void Function()? onTap;
  RoundActionButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 0.0,
        child: Icon(
          icon,
          size: 30,
        ),
        fillColor: Color(0xFF4C4F5E),
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
        onPressed: onTap);
  }
}
