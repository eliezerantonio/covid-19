import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      width: responsive.wp(100),
      height: responsive.hp(100),
      color: const Color(0xff1d2973),
      child: Center(
        child: Image.asset("assets/virus.gif"),
      ),
    );
  }
}
