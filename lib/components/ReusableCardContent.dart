import 'package:flutter/material.dart';
import 'package:guidance_and_counselling/palette.dart';

class ReusableCardContent extends StatelessWidget {
  const ReusableCardContent({this.icon, this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60.0,
          color: kappColorDark,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: TextStyle(
            color: kappColorDark,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
