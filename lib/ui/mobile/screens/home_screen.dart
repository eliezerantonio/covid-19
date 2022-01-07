// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:covid_19_cases/providers/cases_provider.dart';
import 'package:covid_19_cases/ui/mobile/widgets/case_item.dart';
import 'package:covid_19_cases/ui/mobile/widgets/geral_cases_widget.dart';
import 'package:covid_19_cases/ui/mobile/widgets/header_list_cases.dart';
import 'package:covid_19_cases/utils/my_colors.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final cases = context.watch<CasesProvider>().cases;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Covid-19",
              style: TextStyle(
                color: Color(MyColors.primaryColor),
                fontSize: responsive.dp(3),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const GeralCasesWidget(),
            const SizedBox(
              height: 10,
            ),
            HeaderListCases(responsive: responsive),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  itemCount: cases.length,
                  itemBuilder: (context, index) =>
                      CaseItem(responsive: responsive, result: cases[index])),
            )
          ],
        ),
      ),
    ));
  }
}
