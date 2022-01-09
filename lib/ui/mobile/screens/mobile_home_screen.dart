import 'package:animate_do/animate_do.dart';
import 'package:covid_19_cases/providers/cases_provider.dart';
import 'package:covid_19_cases/ui/mobile/widgets/header_list_cases.dart';
import 'package:covid_19_cases/ui/mobile/widgets/case_item.dart';
import 'package:covid_19_cases/ui/shared/widgets/covid_text.dart';
import 'package:covid_19_cases/ui/shared/widgets/filter_case.dart';
import 'package:covid_19_cases/ui/shared/widgets/header_updates.dart';
import 'package:covid_19_cases/utils/my_colors.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileHomeScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final casesProvider = context.watch<CasesProvider>();
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        children: [
          if (casesProvider.loading)
            LinearProgressIndicator(
              color: Color(MyColors.primaryColor),
            ),
          CovidText(),
          const SizedBox(
            height: 30,
          ),
          FilterCase(),
          const SizedBox(
            height: 10,
          ),
          HeaderUpdates(),
          const SizedBox(
            height: 10,
          ),
          HeaderListCases(),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: casesProvider.cases.length,
            itemBuilder: (context, index) => Column(
              children: [
                FadeInLeft(child: CaseItem(result: casesProvider.cases[index])),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          _scrollController.animateTo(
            _scrollController.position.minScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 500),
          );
        },
        icon: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.blue[900]!.withOpacity(0.7),
              shape: BoxShape.circle),
          child: const Icon(Icons.arrow_upward_outlined,
              size: 30, color: Colors.white),
        ),
      ),
    );
  }
}
