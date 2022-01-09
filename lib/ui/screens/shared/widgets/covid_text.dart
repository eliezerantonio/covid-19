import 'package:animate_do/animate_do.dart';
import 'package:covid_19_cases/utils/my_colors.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

class CovidText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return BounceInDown(
      duration: const Duration(milliseconds: 3000),
      child: Text(
        "Covid-19",
        style: TextStyle(
          color: Color(MyColors.primaryColor),
          fontSize: responsive.dp(3),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
