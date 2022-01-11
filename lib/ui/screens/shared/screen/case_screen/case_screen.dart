import 'package:animate_do/animate_do.dart';
import 'package:covid_19_cases/models/result.dart';
import 'package:covid_19_cases/ui/screens/shared/widgets/cases_item.dart';
import 'package:covid_19_cases/ui/screens/shared/widgets/header_updates.dart';

import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../../web/custom_graphic.dart';

class CaseScreen extends StatelessWidget {
  CaseScreen({Key? key, required this.result}) : super(key: key);
  Result result;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.dp(2)),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInRightBig(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  height: responsive.dp(2),
                ),
                Text(
                  "Estado currente",
                  style: TextStyle(fontSize: responsive.dp(2)),
                ),
                SizedBox(
                  height: responsive.dp(2),
                ),
                BounceInDown(
                  delay: const Duration(milliseconds: 100),
                  duration: const Duration(milliseconds: 3000),
                  child: Text(
                    result.state!,
                    style: TextStyle(
                      fontSize: responsive.dp(5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: responsive.dp(2),
                ),
                BounceInLeft(
                  child: Text(
                    result.date!,
                    style: TextStyle(
                      fontSize: responsive.dp(2),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: responsive.dp(2),
                ),
                HeaderUpdates(),
                SizedBox(
                  height: responsive.dp(2),
                ),
                FadeInUpBig(
                  child: Text(
                    "População estimada: ${result.estimatedPopulation}",
                    style: TextStyle(
                      fontSize: responsive.dp(2),
                    ),
                  ),
                ),
                SizedBox(height: responsive.dp(2)),
                FadeInUpBig(
                  child: Text(
                    "População estimada 2019: ${result.estimatedPopulation2019}",
                    style: TextStyle(
                        fontSize: responsive.dp(2), color: Colors.grey),
                  ),
                ),
                SizedBox(height: responsive.dp(2)),
                CasesItem(responsive: responsive, result: result),
                CustomGraphic(result),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
