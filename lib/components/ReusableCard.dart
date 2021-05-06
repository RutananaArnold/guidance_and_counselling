import 'package:flutter/material.dart';
import 'package:guidance_and_counselling/palette.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({this.cardChild, this.action});
  final Widget cardChild;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: kcardBackground,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 150.0,
        width: 150.0,
      ),
    );
  }
}
