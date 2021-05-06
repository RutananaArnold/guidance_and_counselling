import 'package:flutter/material.dart';
import 'package:guidance_and_counselling/config.dart';

class AppTitle extends StatelessWidget {
  final String title;
  AppTitle({
    Key key,
    this.title = appName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w900,
        letterSpacing: -1.8,
      ),
    );
  }
}
