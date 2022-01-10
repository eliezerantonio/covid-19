import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget {
  const CustomTextView({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return FittedBox(
        fit: BoxFit.contain,
        child: Text(
          text,
          style: TextStyle(fontSize: responsive.dp(1.5)),
        ));
  }
}
