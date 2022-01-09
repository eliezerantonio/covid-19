import 'package:covid_19_cases/models/result.dart';
import 'package:covid_19_cases/ui/screens/shared/widgets/cases_item.dart';
import 'package:covid_19_cases/ui/screens/shared/widgets/header_updates.dart';

import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../custom_graphic.dart';

class CaseScreen extends StatelessWidget {
  CaseScreen({Key? key, required this.result}) : super(key: key);
  Result result;

  @override
  Widget build(BuildContext context) {
    final datasGrap = [
      {'genre': 'P.E 2019', 'sold': result.estimatedPopulation2019},
      {'genre': 'Confirm', 'sold': result.confirmed},
      {'genre': 'Mortos', 'sold': result.deaths},
      {'genre': 'death_rate', 'sold': result.deathRate},
      {'genre': 'P.E', 'sold': result.estimatedPopulation},
      {'genre': 'Confirm 100k', 'sold': result.confirmedPer100kInhabitants},
    ];
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
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                Text(
                  result.state!,
                  style: TextStyle(
                    fontSize: responsive.dp(5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: responsive.dp(2),
                ),
                Text(
                  result.date!,
                  style: TextStyle(
                    fontSize: responsive.dp(2),
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: responsive.dp(2),
                ),
                HeaderUpdates(),
                SizedBox(
                  height: responsive.dp(2),
                ),
                Text(
                  "População estimada: ${result.estimatedPopulation}",
                  style: TextStyle(
                    fontSize: responsive.dp(2),
                  ),
                ),
                SizedBox(height: responsive.dp(2)),
                Text(
                  "População estimada 2019: ${result.estimatedPopulation2019}",
                  style:
                      TextStyle(fontSize: responsive.dp(2), color: Colors.grey),
                ),
                SizedBox(height: responsive.dp(2)),
                CasesItem(responsive: responsive, result: result),
                CustomGraphic(datasGrap),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
