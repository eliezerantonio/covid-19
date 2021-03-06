import 'package:animate_do/animate_do.dart';
import 'package:covid_19_cases/utils/my_colors.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

class HeaderUpdates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return FadeInUpBig(
      child: Container(
        height: responsive.hp(10),
        width: responsive.wp(100),
        alignment: Alignment.center,
        child: Text("Covid-19 Ultimas Atualizações",
            style:
                TextStyle(color: Colors.white, fontSize: responsive.dp(2.4))),
        decoration: BoxDecoration(
          color: Color(MyColors.primaryColor),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
